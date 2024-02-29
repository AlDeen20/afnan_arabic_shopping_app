import { Router } from "express";
const router = Router();
import applinkModel from '../models/appLink.js';
import adminModel from '../models/admins.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';



// ========== get ==========
router.get('/', async (req, res)=>{
  try {
      const links = await applinkModel.findAll();
      res.status(200).json({'data': links, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// ========== update ==========
router.put('/update', accessToken, async (req, res) => {
   try {
    const { id, link } = req.body;
    const admin_access = req.headers['admin-role'];
    const check_access = await adminModel.findOne({ where: { username:admin_access} });
    const getLink = await applinkModel.findByPk(id);
    if (!getLink && check_access) {
      return res.status(404).json({ message: 'link not found' });
    }
    // Update the link's data
    await getLink.update({link});
    return res.json({ message: 'link updated successfully' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});


export default router