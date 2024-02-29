import { Router } from "express";
const router = Router();
import multer from "multer";
import subcategoriesModel from '../models/subcategories.js';
import productsModel from '../models/products.js';
import productImageModel from '../models/productImage.js';
import imgDelete from '../config/imgDelete.js';
import accessToken from '../config/access_token.js';
import accessAdmin from '../config/access_admin.js';





const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/products/');
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const fileExtension = file.originalname.split('.').pop();
    cb(null, uniqueSuffix + '.' + fileExtension);
  },
});
const upload = multer({ storage: storage });



router.get('/', accessToken,  async (req, res)=>{
    const subcatid = req.query.subcategory_id;
    try {
        const products = await productsModel.findAll({where: {subcategory_id: subcatid} });
        res.json(products)
      } catch (error) {
        res.status(500).json({ error: 'Error fetching ' });
      }
});



// show all products for admin
router.get('/all', accessToken,  async (req, res)=>{
  try {
      const products = await productsModel.findAll();
      res.status(200).json({'data': products, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
})

// show products in specific category
router.get('/specific-category', accessToken, async (req, res)=>{
  const catid = req.query.category_id;
  try {
    const subcategories = await subcategoriesModel.findAll({where: {category_id: catid}});
    if(subcategories){
      const subcategories_ids = subcategories.map(item => item.id);
      const products = await productsModel.findAll({where: {subcategory_id: subcategories_ids} });
      res.json(products)
    }

    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
});


// prduct details for user
router.get('/product-details', accessToken, async (req, res)=>{
  try {
     const productID = req.query.product_id;
     const product = await productsModel.findOne({where: { id: productID } });
     const images = await productImageModel.findAll({where: { product_id: productID } });
     return res.status(200).json({'product': product, 'images': images, 'status': 'success'});

    } catch (error) {
      return res.status(500).json({ error: 'Error fetching ' });
    }
});


// show all products for users
router.get('/search', accessToken, async (req, res)=>{
  try {
      const products = await productsModel.findAll();
      const images = await productImageModel.findAll();
      res.status(200).json({'products': products, 'images': images, 'status': 'success'});
    } catch (error) {
      res.status(500).json({ error: 'Error fetching ' });
    }
})



//add 
router.post('/add', accessToken,  upload.array('images'), async (req, res) => {

  try {
    const title = req.body.title;
    const price = req.body.price;
    const subcategory_id = req.body.subCategoryID;
    const des = req.body.des;
    const { files } = req;
    if (!title) {
      return res.status(400).json({ message: 'Title is required' });
    }
    const newProduct = await productsModel.create({
      title,
      price,
      des,
      subcategory_id,
    });
    
    if (!files || Object.keys(files).length === 0) {
      return res.status(400).send('No files were uploaded.');
    }

      //Handle the uploaded files and associate them with the product
    if(newProduct){
      const imageUrls = [];
      for (const key in files) {
        const image = files[key];
        const imageName = image.filename;
        const savedImage = await productImageModel.create({ imageUrl: imageName, product_id: newProduct.id });
        imageUrls.push(savedImage.imageUrl);
    }
    await productsModel.update({ imageUrl: imageUrls[0] }, { where: { id: newProduct.id } });
    }
    return res.status(201).json(newProduct);
  } catch (error) {
    console.error('Error creating product:', error);
    return res.status(500).json({ message: 'Internal server error' });
  }
});




// delete
router.delete('/delete/:id', accessToken, async (req, res) => {
  try {
    const productId = req.params.id;
    const product = await productsModel.findByPk(productId);

    if (!product) {
      return res.status(404).json({ message: 'product not found' });
    }
      const images = await productImageModel.findAll({where: {product_id: productId} });
      for (let index = 0; index < images.length; index++) {
      imgDelete('products', images[index].imageUrl);
     }
    await product.destroy();
    return res.status(204).send();
  } catch (error) {
    return res.status(500).json({ message: 'Internal server error' });
  }
});


export default router;