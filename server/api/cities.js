import { Router } from "express";
const router = Router();
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';
import deliveryPriceModel from '../models/deliveryPrice.js';

// show all deliveryPrice for users
router.get('/', accessToken, async (req, res)=>{
  try {
      const deliveryPrice = await deliveryPriceModel.findAll();
      return res.status(200).json({ 'data': deliveryPrice,  'status': 'success'});

      // res.json(deliveryPrice)
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


export default router;