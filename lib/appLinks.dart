// ignore_for_file: file_names
//http://192.168.0.117:3000
class AppLinks {
  // static const String server = 'http://192.168.0.100:3000';
  static const String server = 'https://afnan.cloud';
  static const String apiServer = '$server/api';
  static String productImageUrl = '$server/uploads/products/';
  static String categoriesImageUrl = '$server/uploads/categories';
  static const String homeUrl = '$apiServer/home';
  static const String categoriesUrl = '$apiServer/categories';
  static const String subcategoriesUrl =
      '$apiServer/subcategories?category_id=';
  static const String productDetails =
      '$apiServer/products/product-details?product_id=';
  static const String productsInCart = '$apiServer/cart/showproductsincart';
  static const String cities = '$apiServer/cities';
  static const String orderProducts =
      '$apiServer/checkouts/order-products?order_id=';
  static const String orders = '$apiServer/orders/show-specific?user_id=';
  static const String search = '$apiServer/products/search';
  static const String share = '$apiServer/applink';
  // delete req
  static const String ordersDelete =
      '$apiServer/orders/delete-specific?order_id=';
  // update req
  static const String updatePassword = '$apiServer/users/update';
}
