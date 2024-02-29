import { Router } from "express";
const router = Router();
import categoriesModel from '../models/categories.js';
import productsModel from '../models/products.js';
import productImageModel from '../models/productImage.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';




// prduct details for user
router.get('/', accessToken, async (req, res)=>{
  try {
     const categories = await categoriesModel.findAll();
     const products = await productsModel.findAll( { order: [['createdAt', 'DESC']], limit: 10 } );
    // get last 10 products id 
    const products_id = products.map(item => item.id);
     const images = await productImageModel.findAll({where: { product_id: products_id } });
     return res.status(200).json({'categories': categories, 'products': products, 'images': images, 'status': 'success'});

    } catch (error) {
      return res.status(500).json({ error: 'Error fetching ' });
    }
});


export default router;