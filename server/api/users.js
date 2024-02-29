import { Router } from "express";
const router = Router();
import usersModel from '../models/users.js';
import jwtSecret from '../config/config.js';
import jsonwebtoken from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';







// get all for admin
router.get('/', accessToken, async (req, res)=>{
  try {
    const users = await usersModel.findAll();
    res.status(200).json({'data': users, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});

// ========== sign in ==========

router.post('/signin', async (req, res) => {
  try {
    const { phone, password } = req.body;
    const user = await usersModel.findOne({ where: { phone: phone} });
    if (user) {
       const passwordMatch = await bcrypt.compare(password, user.password);
      if(passwordMatch){
        const token = jsonwebtoken.sign({ userId: user.id }, jwtSecret, {
          expiresIn: '3650d', // Token expiration time (10 years)
        });
      return  res.json({ token , user});
      }
      return  res.status(401).json('رقم الهاتف أو كلمة المرور غير صحيحة');
    }
    else{
      return  res.status(401).json('رقم الهاتف أو كلمة المرور غير صحيحة');
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'حدث خطأ ما' });
  }
});



// ========== sign up ==========

router.post('/signup', async (req, res) => {
  const { name, phone, password } = req.body;
  try {
    if(name && phone && password){
     const hashPassword = await  bcrypt.hash(password, 10);
      const user = await usersModel.findOne({ where: { phone} });
    if(!user){
      const newUser = await usersModel.create({ name, phone, password:hashPassword });
      const token = jsonwebtoken.sign({ userId: newUser.id }, jwtSecret, {
        expiresIn: '3650d', // Token expiration time (10 years)
      });

     return res.json({ token , newUser});
    }
    return res.status(404).json('رقم الهاتف مستخدم سابقا');
    }else{
      return res.status(404).json('رقم الهاتف مستخدم سابقا');
    }

  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: 'حدث خطأ ما' });
  }
});



// update password
router.put('/update', accessToken, async (req, res)=>{
  try {

    password = req.body.password;
    id = req.body.userID;
    const hashPassword = await bcrypt.hash(password, 10);
    const user = await usersModel.findOne({where: {id}});
    if(user){
      const updateUser = await user.update({password:hashPassword});
      return res.status(200).json({'status': 'success'});
    }else{
      return res.send('err');
    }

    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
})

export default router;
