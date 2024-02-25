import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/bindings/initialBinging.dart';
import 'package:shopping_app/constants.dart';
import 'package:shopping_app/functions/timeAgoIntl.dart';
import 'package:shopping_app/routes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timeago/timeago.dart' as timeago;

Box? databox;
CollectionBox? cartBox;
BoxCollection? collection;

Future<Box> openHiveBox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }
  return await Hive.openBox(boxname);
} 

Future<BoxCollection> openHiveCollectionBox(Set<String> box) async {
  final appDocumentDir = await getApplicationDocumentsDirectory();
// Create a box collection
  return await BoxCollection.open(
    'afnan', // Name of your database
    box, // Names of your boxes
    path: appDocumentDir.path,
  );
}

Future<void> subscribeToTopicUser() async {
  if (databox!.get("userData") != null) {
    final userData = await databox!.get("userData");
    FirebaseMessaging.instance.subscribeToTopic(userData['userId'].toString());
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databox = await openHiveBox('afnan');
  collection = await openHiveCollectionBox({"cart", "myfav"});
  cartBox = await collection!.openBox('cart');
  await initializeDateFormatting('ar', null);
  await Firebase.initializeApp();
  // FirebaseMessaging.instance.unsubscribeFromTopic('users');
  FirebaseMessaging.instance.subscribeToTopic('users');
  subscribeToTopicUser();
  timeago.setLocaleMessages('ar', TimeAgoIntlMessages('ar'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AFNAN MALL',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
        ),
        appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('AE'),
      ],
      initialBinding: InitialBinding(),
      locale: const Locale('ar', 'AE'),
      getPages: AppRoutes.routes,
    );
  }
}
