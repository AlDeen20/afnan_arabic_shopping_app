import { Router } from "express";
const router = Router();
import adminModel from '../models/admins.js';
import jwtSecret from '../config/config.js';
import jsonwebtoken from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';




// show all admins for admin
router.get('/', accessToken, async (req, res)=>{
  try {
    const admin_access = req.headers['admin-role'];
    const check_access = await accessAdmin(admin_access);
     if(check_access){
      const admins = await adminModel.findAll();
      return res.status(200).json({'data': admins, 'status': 'success'});
     }
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});



// ========== sign up ==========
router.post('/add', accessToken, async (req, res) => {
  try {
    const { name, username, password } = req.body;
    const admin_access = req.headers['admin-role'];
    if(name && username && password && admin_access){
      const check_access = await accessAdmin(admin_access);
      const admin = await adminModel.findOne({ where: { username} });
    if(!admin && check_access){
      const hashedPassword = await bcrypt.hash(password, 10);
      const newAdmin = await adminModel.create({ name, username, password:hashedPassword });
      return res.status(201).json(newAdmin);
    }else{
    return res.status(203).send('اسم المستخدم مسجل سابقا');
    }
   
    }else{
      return res.status(404).send('يرجى ملئ جميع البيانات');
    }

  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'حدث خطأ ما' });
  }
});


// ========== sign in ==========
router.post('/signin', async (req, res) => {
  const { username, password } = req.body;
  try {
    if(username && password){
    const admin = await adminModel.findOne({ where: { username } });
      if (admin) {
        const isPasswordValid = await bcrypt.compare(password, admin.password);
        if(isPasswordValid){
          const token = jsonwebtoken.sign({ adminId: admin.id }, jwtSecret, {
            expiresIn: '3650d', // Token expiration time (10 years)
          });
        res.json({ token , admin});
        }else{
          res.status(401).send('كلمة المرور غير صحيحة');
        }
    }
    else{
       res.status(401).send(' اسم المستخدم أو كلمة المرور غير صحيحة');
    }
    } 
  } catch (error) {
    res.status(500).send(' اسم المستخدم أو كلمة المرور غير صحيحة');
  }
});


// ========== update ==========
router.put('/update', accessToken, async (req, res) => {
   try {
    const { adminID, name, username } = req.body;
    const admin_access = req.headers['admin-role'];
    const check_access = await accessAdmin(admin_access);
    const admin = await adminModel.findByPk(adminID);

    if (!admin && check_access) {
      return res.status(404).json({ message: 'admin not found' });
    }

    // Update the admin's data
    await admin.update({name, username});

    return res.json({ message: 'admin updated successfully' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});


// ========== update password ==========
router.put('/update/password', accessToken, async (req, res) => {
   try {
    const { adminID, password, } = req.body;
    const admin_access = req.headers['admin-role'];
    const check_access = await accessAdmin(admin_access);
    const admin = await adminModel.findByPk(adminID);
    if (!admin && check_access) {
      return res.status(404).json({ message: 'admin not found' });
    }
    const hashedPassword = await bcrypt.hash(password, 10);
    // Update the admin's data
    await admin.update({password: hashedPassword});

    return res.json({ message: 'admin updated successfully' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});


// delete
router.delete('/delete/:id', accessToken, async (req, res) => {
  try {
    const adminID = req.params.id;
    const admin_access = req.headers['admin-role'];
    const check_access = await accessAdmin(admin_access);
    const admin = await adminModel.findByPk(adminID);
    if (admin && check_access) {
      await admin.destroy();
      return res.status(204).send();
    }
    return res.status(404).json({ message: 'admin not found' });
  } catch (error) {
    console.error('Error deleting admin:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});



export default router;
