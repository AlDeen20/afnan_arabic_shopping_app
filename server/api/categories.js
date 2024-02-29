import { Router } from "express";
const router = Router();
import categoriesModel from '../models/categories.js';
import adminsModel from '../models/admins.js';
import multer from "multer";
import imgDelete from '../config/imgDelete.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';




const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/categories/');
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const fileExtension = file.originalname.split('.').pop();
    cb(null, uniqueSuffix + '.' + fileExtension);
  },
});
const upload = multer({ storage: storage });




// test
router.get('/', accessToken, async (req, res)=>{
  try {
      const categories = await categoriesModel.findAll();
      res.status(200).json({'data': categories, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// POST route to create a new category
router.post('/add', upload.single('image'), accessToken, async (req, res) => {
  try {
  const { title } = req.body;
  const admin_access = req.headers['admin-role'];
  const image = req.file.filename;
    if (!title) {
      return res.status(400).json({ message: 'Title is required' });
    }
    const check_access = await adminsModel.findOne({ where: { username:admin_access} });
   if(check_access){
    const newCategory = await categoriesModel.create({ title, imageUrl: image });
    return res.status(201).json(newCategory); 
   }
  } catch (error) {
    console.error('Error creating category:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});





// ========== update ==========
router.put('/update', accessToken, async (req, res) => {
  const { categoryID, title } = req.body;
  const admin_access = req.headers['admin-role'];
  if( categoryID && title  && admin_access){
   try {
    const check_access = await adminsModel.findOne({ where: { username:admin_access} });
    const category = await categoriesModel.findByPk(categoryID);

    if (!category && check_access) {
      return res.status(404).json({ message: 'category not found' });
    }

    // Update the category's data
    await category.update({title});

    return res.json({ message: 'category updated successfully' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
}else{
  res.send('all data required');
}
});



// ========== img update ==========
router.put('/img-update', upload.single('image'), accessToken, async (req, res) => {
  const { categoryID } = req.body;
  const admin_access = req.headers['admin-role'];
  const imageUrl = req.file.filename;
  if( categoryID && admin_access){
   try {
    const check_access = await adminsModel.findOne({ where: { username:admin_access} });
    const category = await categoriesModel.findByPk(categoryID);

    if (!category && check_access) {
      return res.status(404).json({ message: 'category not found' });
    }
    imgDelete('categories', category.imageUrl);
    // Update the category's data
    await category.update({imageUrl});

    return res.json({ message: 'category updated successfully' });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Internal server error' });
  }
}else{
  res.send('all data required');
}
});

// delete
router.delete('/delete/:id', accessToken, async (req, res) => {
  try {
    const categoryId = req.params.id;
    const admin_access = req.headers['admin-role'];
    const check_access = await adminsModel.findOne({ where: { username:admin_access} });
    const category = await categoriesModel.findByPk(categoryId);

    if (category && check_access) {
      imgDelete('categories', category.imageUrl);
      await category.destroy();
      return res.status(204).send();
    }
    return res.status(404).json({ message: 'Category not found' });

  } catch (error) {
    console.error('Error deleting category:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});


export default router
