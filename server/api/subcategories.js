import { Router } from "express";
const router = Router();
import subcategoriesModel from '../models/subcategories.js';
import productsModel from '../models/products.js';
import productImageModel from '../models/productImage.js';
import adminsModel from '../models/admins.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';


// show all subactegories for admin
router.get('/all', accessToken, async (req, res)=>{
  try {
      const subcategories = await subcategoriesModel.findAll();
      res.status(200).json({'data': subcategories, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});



// for user get sub categories in specifice category
router.get('/', accessToken, async (req, res)=>{
    try {
      const categoryID = req.query.category_id;

      const subcategories = await subcategoriesModel.findAll({where: {category_id: categoryID} });
      // get all subcategories id in specific category
      const subcategories_id = subcategories.map(item => item.id);
      // show all products in specific category
      const products = await productsModel.findAll({where: {subcategory_id: subcategories_id}});
      // get all products id in specific category
      const products_id = products.map(item => item.id);
      // show all products in specific images
      const images = await productImageModel.findAll({where: {product_id: products_id}});

      res.status(200).json({'data': subcategories, 'products': products, 'images': images, 'status': 'success'});
        // res.json(subcategories)
      } catch (error) {
        res.status(500).json({ error: 'Error fetching ' });
      }
})





// POST route to create a new subcategory
router.post('/add', accessToken, async (req, res) => {
  try {
    const title = req.body.title;
    const category_id = req.body.categoryID;
    const admin_access = req.headers['admin-role'];
    if (!title) {
      return res.status(400).json({ message: 'Title is required' });
    }
    const check_access = await adminsModel.findOne({ where: { username: admin_access} });
    if(check_access){
      const newSubCategory = await subcategoriesModel.create({ title, category_id });
      return res.status(201).json(newSubCategory); 
    }
  } catch (error) {
    console.error('Error creating subcategory:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});







// ========== update ==========
router.put('/update', accessToken, async (req, res) => {
  const { subCategoryID, title, authusername } = req.body;
  if( subCategoryID && title  && authusername){
   try {
    const check_access = await adminsModel.findOne({ where: { username: authusername} });
    const subcategory = await subcategoriesModel.findByPk(subCategoryID);

    if (!subcategory && check_access) {
      return res.status(404).json({ message: 'subcategory not found' });
    }

    // Update the subcategory's data
    await subcategory.update({title});

    return res.json({ message: 'subcategory updated successfully' });
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
    const subcategory_id = req.params.id;
    const admin_access = req.headers['admin-role'];
    const check_access = await adminsModel.findOne({ where: { username: admin_access} });
    const subcategory = await subcategoriesModel.findByPk(subcategory_id);
    if (subcategory && check_access) {
      await subcategory.destroy();
      return res.status(204).send();
    }
    return res.status(404).json({ message: 'Category not found' });
  } catch (error) {
    console.error('Error deleting category:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});

export default router;
