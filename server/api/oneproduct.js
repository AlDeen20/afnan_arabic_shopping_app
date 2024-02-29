import { Router } from "express";
const router = Router();
import productsModel from '../models/products.js';
import accessToken from '../config/access_token.js';



router.get('/', accessToken, async (req, res)=>{
    const id = req.query.id;
    try {
        const product = await productsModel.findOne({where: { id } });
       return  res.json(product);
      } catch (error) {
        return res.status(500).json({ error: 'Error fetching ' });
      }
});


export default router;