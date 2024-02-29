const express = require("express");
const router = express.Router();
const usersModel = require('../models/users');



// ========== sign in ==========

router.post('/signin', async (req, res) => {
  const { phone, password } = req.body;
  try {
    const user = await usersModel.findOne({ where: { phone, password} });

    if (user) {
      res.json(user);
    } else {
      res.status(404).json('رقم الهاتف او كلمة المرور غير صحيحة');
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
    const user = await usersModel.findOne({ where: { phone} });
    if(!user){
      const newUser = await usersModel.create({ name, phone, password });
      res.status(200).json ('تم التسجيل بنجاح' );
    }else{
      res.status(404).json('رقم الهاتف مستخدم سابقا');
    }

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'حدث خطأ ما' });
  }
});


module.exports = router;
