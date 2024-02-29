import { Router } from "express";
const router = Router();
import galleryModel from '../models/gallery.js';
import multer from "multer";
import imgDelete from '../config/imgDelete.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';




const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/gallery/');
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const fileExtension = file.originalname.split('.').pop();
    cb(null, uniqueSuffix + '.' + fileExtension);
  },
});
const upload = multer({ storage: storage });



router.get('/', accessToken,  async (req, res)=>{
    try {
        const images = await galleryModel.findAll({});
        res.status(200).json({'data': images, 'status': 'success'});
      } catch (error) {
        res.status(500).json({ error: 'Error fetching ' });
      }
});


//upload images to gallery 
router.post('/upload', accessToken,  upload.array('images'), async (req, res) => {

  try {
    const { files } = req;
    if (!files || Object.keys(files).length === 0) {
      return res.status(400).send('No files were uploaded.');
    }
      for (const key in files) {
        const image = files[key];
        const imageName = image.filename;
        await galleryModel.create({ imageUrl: imageName });
    }
    return res.status(200).json({'status': 'success'});
  } catch (error) {
    console.error('Error creating product:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }

});




// delete
router.post('/delete', accessToken, async (req, res) => {
  try {
    const id = req.body.id;
    const image = await galleryModel.findOne({where:{id}});

    if (!image) {
      return res.status(404).json({ message: 'image not found' });
    }
    imgDelete('gallery', image.imageUrl);
    await image.destroy();
    return res.status(200).json({'status': 'success'});
  } catch (error) {
    return res.status(500).json({ message: 'Internal server error' });
  }
});


export default router;