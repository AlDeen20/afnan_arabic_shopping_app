import { Router } from "express";
const router = Router();
import adminsModel from '../models/admins.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';

import ordersModel from '../models/orders.js';
import checkoutsModel from '../models/checkouts.js';
import sendNotifications from '../config/sendNotifications.js';




// get all for admin
router.get('/', accessToken, async (req, res)=>{
  try {
    const orders = await ordersModel.findAll();
    res.status(200).json({'data': orders, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// get order by id for admin
router.get('/specific', accessToken, async (req, res)=>{
  try {
    const orderID =  req.query.orderID;
    const order = await ordersModel.findOne({where: {id: orderID}});
    res.status(200).json(order)
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// get specific orders by user_id
router.get('/show-specific', accessToken, async (req, res)=>{
  try {
    const user_id = req.query.user_id;
    const orders = await ordersModel.findAll({where:{user_id}});
    return res.status(200).json({'orders': orders, 'status': 'success'});

    // res.status(200).json(orders)
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// delete specific orders by user_id
router.delete('/delete-specific', accessToken, async (req, res)=>{
  try {
    const order_id = req.query.order_id;
    const order = await ordersModel.findOne({where: {id: order_id}});
    if(order){
      await order.destroy();
      return res.status(200).json({'status': 'success'});
    }else{
      return res.status(200).json({'status': 'err'});
    }
    // res.status(200).json(orders)
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});

router.post('/insert', accessToken, async (req, res)=>{
  try {
    const productsData =  req.body.productsData;
    const delivery_price = req.body.delivery_price;
    const totalProducts_price = req.body.totalProducts_price;
    const order_price = req.body.order_price;
    const user_phone = req.body.user_phone;
    const user_city = req.body.user_city;
    const user_address = req.body.user_address;
    const user_id = req.body.user_id;
	

    const newOrder = await ordersModel.create({ delivery_price, totalProducts_price, order_price, user_phone, user_city, user_address, order_status: '0', user_id });
    if(newOrder){
      for (let index = 0; index < productsData.length; index++) {
        const product_id =  productsData[index]['id'];
        const amount =  productsData[index]['quantity'];
        const product_price =  productsData[index]['price'];
        await checkoutsModel.create({ product_id, product_price, amount, order_id: newOrder.id });
      }
    }
      res.status(200).send('تم اضافة الطلب بنجاح');
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// update order by id for admin
router.post('/update', accessToken, async (req, res)=>{
  try {
    const orderID =  req.body.orderID;
    const order_status = req.body.status;
    const userID = req.body.userID;
    const notificationBody = req.body.notificationBody;
    const authusername = req.body.authusername;
    const message = {
      notification: {
        title: 'تنبية',
        body: notificationBody,
      },
      topic: `${userID}`,
    };

    const check_access = await adminsModel.findOne({ where: { username:authusername} });
    const order = await ordersModel.findOne({where: {id: orderID}});
    if(check_access && order){
      await order.update({order_status});
      await sendNotifications(message);    
      return  res.status(200).json({'status': 'success'});
    }else{
      return  res.status(200).json({'status': 'err'});
    }
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});

 
// delete order by admin (not approve)
router.post('/delete', accessToken, async (req, res) => {
  try {
    const id = req.body.orderID;
    const userID = req.body.userID;
    const admin_access = req.headers['admin-role'];
    const check_access = await adminsModel.findOne({ where: { username: admin_access} });
    const order = await ordersModel.findByPk(id);
    if (order && check_access) {
      await order.destroy();
      const message = {
        notification: {
          title: 'تنبية',
          body: 'لقد تم رفض طلبك',
        },
        topic: userID,
      };
      await sendNotifications(message);
      return res.status(204).send();
    }
    return res.status(404).json({ message: 'order not found' });

  } catch (error) {
    console.error('Error deleting order:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});

export default router;