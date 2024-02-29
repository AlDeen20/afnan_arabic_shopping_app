import { Router } from "express";
const router = Router();
import adminsModel from '../models/admins.js';
import deliveryPriceModel from '../models/deliveryPrice.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';



// show all deliveryPrice for admin
router.get('/', accessToken, async (req, res)=>{
  try {
     const admin_access = req.headers['admin-role'];
     const check_access = await adminsModel.findOne({ where: { username: admin_access} });
     if(check_access){
      const deliveryPrice = await deliveryPriceModel.findAll();
      res.status(200).json({'data': deliveryPrice, 'status': 'success'});
     }
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});



// ==========  add new ==========
router.post('/add', accessToken, async (req, res) => {
  try {
    const { city_name, delivery_price } = req.body;
    const admin_access = req.headers['admin-role'];
    if(city_name && delivery_price){
      const check_access = await adminsModel.findOne({ where: { username:admin_access} });
      const deliveryPrice = await deliveryPriceModel.findOne({ where: { city_name} });
    if(!deliveryPrice && check_access){
      const newdeliveryPrice = await deliveryPriceModel.create({ city_name, delivery_price});
      res.status(201).json(newdeliveryPrice);
      return
    }else{
      res.status(203).send('المدينة مضافة سابقا');
    }
   
    }else{
      res.status(404).send('يرجى ملئ جميع البيانات');
    }

  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'حدث خطأ ما' });
  }
});




// delete
router.delete('/delete/:id', accessToken,  async (req, res) => {
  try {
    const admin_access = req.headers['admin-role'];
    const id = req.params.id;
    const check_access = await adminsModel.findOne({ where: { username: admin_access} });
    const deliveryPrice = await deliveryPriceModel.findByPk(id);
    if (deliveryPrice && check_access) {
      await deliveryPrice.destroy();
      return res.status(204).send();
    }
    return res.status(404).json({ message: 'deliveryPrice not found' });
  } catch (error) {
    console.error('Error deleting deliveryPrice:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});


export default router;
