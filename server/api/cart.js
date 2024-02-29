const  express  = require("express");
const router = express.Router();
const cartModel = require('../models/cart');
const productImageModel = require('../models/productImage');
const accessToken = require('../config/access_token');
const productsModel = require('../models/products');



//======== show product in cart ========
router.post('/showproductsincart', accessToken, async (req, res)=>{
  const product_ids = req.body.product_ids;
  try {
    const products = await productsModel.findAll({where: {id: product_ids}});
     const images = await productImageModel.findAll({where: { product_id: product_ids } });
     return res.status(200).json({ 'products': products, 'images': images, 'status': 'success'});

    } catch (error) {
      return res.status(500).json({ error: 'Error fetching ' });
    }
});




module.exports = router;