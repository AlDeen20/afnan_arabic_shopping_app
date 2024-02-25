import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shopping_app/index.dart';
import 'package:shopping_app/views/screens/CitiesScreen.dart';
import 'package:shopping_app/views/screens/MyOrdersScreen.dart';
import 'package:shopping_app/views/screens/authScreen.dart';
import 'package:shopping_app/views/screens/categoriesScreen.dart';
import 'package:shopping_app/views/screens/checkOutScreen.dart';
import 'package:shopping_app/views/screens/homeScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/aboutScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/changePasswordScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/myProfileScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/privacyScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/supportScreen.dart';
import 'package:shopping_app/views/screens/myAccounScreens/termsConditionsScreen.dart';
import 'package:shopping_app/views/screens/orderDetailsScreen.dart';
import 'package:shopping_app/views/screens/productDetailsScreen.dart';
import 'package:shopping_app/views/screens/shareScreen.dart';
import 'package:shopping_app/views/screens/shoppingCartScreen.dart';
import 'package:shopping_app/views/screens/signinScreen.dart';
import 'package:shopping_app/views/screens/signupScreen.dart';
import 'package:shopping_app/views/screens/subCategoriesScreen.dart';
import 'package:shopping_app/views/screens/successfulyScreen.dart';

class AppRoutes {
  static const String auth = '/';
  static const String index = '/index';
  static const String home = '/home';
  static const String siginin = '/siginin';
  static const String siginup = '/siginup';
  static const String categories = '/categories';
  static const String subcategories = '/subcategories';
  static const String productsdetails = '/productsdetails';
  static const String shoppingcart = '/shoppingcart';
  static const String citiesScreen = '/citiesScreen';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String orderdetails = '/orderdetails';
  static const String changepasword = '/changepasword';
  static const String successfuly = '/successfuly';
  //static page
  static const String conditions = '/conditions';
  static const String about = '/about';
  static const String privacy = '/privacy';
  static const String support = '/support';
  static const String myProfile = '/myprofile';
  static const String share = '/share';

  // screens
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: auth, page: () => const AuthScreen()),
    GetPage(name: index, page: () => const IndexScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: categories, page: () => const CategoriesScreen()),
    GetPage(name: subcategories, page: () => const SubCategoriesScreen()),
    GetPage(name: productsdetails, page: () => const ProductDetailsScreen()),
    GetPage(name: shoppingcart, page: () => const ShoppingCartScreen()),
    GetPage(name: citiesScreen, page: () => const CitiesScreen()),
    GetPage(name: checkout, page: () => const CheckOutScreen()),
    GetPage(name: orders, page: () => const MyOrdersScreen()),
    GetPage(name: orderdetails, page: () => const OrderDetailsScreen()),
    GetPage(name: siginin, page: () => const SigninScreen()),
    GetPage(name: siginup, page: () => const SignupScreen()),
    GetPage(name: changepasword, page: () => const ChangePasswordScreen()),
    GetPage(name: successfuly, page: () => const SuccessfulyScreen()),

    // static screen
    GetPage(name: conditions, page: () => const TermsConditionsScreen()),
    GetPage(name: privacy, page: () => const PrivacyScreen()),
    GetPage(name: about, page: () => const AboutScreen()),
    GetPage(name: support, page: () => const SupportScreen()),
    GetPage(name: myProfile, page: () => const MyProfileScreen()),
    GetPage(name: share, page: () => const ShareScreen()),
  ];
}
