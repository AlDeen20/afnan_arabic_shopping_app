import { Router } from "express";
const router = Router();
import adminsModel from '../models/admins.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';
import sendNotifications from '../config/sendNotifications.js';



// ======== send notification ========
router.post('/', accessToken, async(req, res) => {
    const { title, body, image, topic, authusername } = req.body;  
    if (!title || !body) {
      return res.status(400).json({ error: 'Invalid request. Missing topic, title, or body.' });
    }
    const check_access = await adminsModel.findOne({ where: { username: authusername} });
    if(check_access && image != 'null'){
      const message = {
        notification: {
          title,
          body,
          image: image,
        },
        topic,
      };
      await sendNotifications(message);
      return res.status(200).json({ success: true });
    }
    else{
      const message = {
        notification: {
          title,
          body,
        },
        topic,
      };
      await sendNotifications(message);
      return res.status(200).json({ success: true });
    }

  });


export default router;