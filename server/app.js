import express, { json } from 'express';
const app = express();
const port = 3000;
import cors from 'cors';
import './config/db.js';
import firebaseAdmin from 'firebase-admin';

import './relations/relations.js';

// midlware
app.use(cors());
app.use(json());
app.use('/uploads', express.static('uploads'));


// Initialize Firebase Admin SDK with your service account key
import serviceAccountKey from './serviceAccountKey.js';
firebaseAdmin.initializeApp({
  credential: firebaseAdmin.credential.cert(serviceAccountKey),
});




// API REST
import adminsApi from './api/admins.js';
import usersApi from './api/users.js';
import categoriesApi from './api/categories.js';
import subcategoriesApi from './api/subcategories.js';
import productsApi from './api/products.js';
import oneproductApi from './api/oneproduct.js';
import imagesApi from './api/images.js';
import deliveryPriceApi from './api/deliveryPrice.js';
import notificationsApi from './api/notifications.js';
// import cartApi from './api/cart';
import citiesApi from './api/cities.js';
import checkoutsApi from './api/checkouts.js';
import ordersApi from './api/orders.js';
import homeApi from './api/home.js';
import galleryApi from './api/gallery.js';
import appLink from './api/appLink.js';




app.use('/api/admins', adminsApi);
app.use('/api/users', usersApi);
app.use('/api/categories', categoriesApi);
app.use('/api/subcategories', subcategoriesApi);
app.use('/api/products', productsApi);
app.use('/api/oneproduct', oneproductApi);
app.use('/api/images', imagesApi);
app.use('/api/deliveryPrice', deliveryPriceApi);
app.use('/api/notifications', notificationsApi);
// app.use('/api/cart', cartApi);
app.use('/api/cities', citiesApi);
app.use('/api/checkouts', checkoutsApi);
app.use('/api/orders', ordersApi);
app.use('/api/home', homeApi);
app.use('/api/gallery', galleryApi);
app.use('/api/applink', appLink);








app.listen(port, ()=>{
    console.log('server is runing');
});