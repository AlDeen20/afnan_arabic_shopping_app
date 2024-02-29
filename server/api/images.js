import { Router } from "express";
const router = Router();
import productImageModel from '../models/productImage.js';
import accessToken from '../config/access_token.js';



router.get('/', accessToken, async (req, res)=>{
    try {
        const images = await productImageModel.findAll();
        res.status(200).json({'data': images, 'status': 'success'});
      } catch (error) {
        res.status(500).json({ error: 'Error fetching ' });
      }
});



// get images for specific product
router.get('/specific', accessToken, async (req, res)=>{
  const product_id = req.query.product_id;
  try {
      const images = await productImageModel.findAll({where: { product_id } });
     return  res.json(images);
    } catch (error) {
      return res.status(500).json({ error: 'Error fetching ' });
    }
});


export default router;