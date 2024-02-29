import { Router } from "express";
const router = Router();
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';
import checkoutsModel from '../models/checkouts.js';
import productsModel from '../models/products.js';



// show order products  for user
router.get('/order-products', accessToken, async (req, res)=>{
  try {
     const orderID = req.query.order_id;
     const products = await checkoutsModel.findAll({where: { order_id: orderID } });
     const product_ids = products.map(item => item.product_id);
     const products_title = await productsModel.findAll({where: { id: product_ids } });
     return res.status(200).json({'products': products, 'products_title': products_title, 'status': 'success'});
    } catch (error) {
      return res.status(500).json({ error: 'Error fetching ' });
    }
});


export default router;