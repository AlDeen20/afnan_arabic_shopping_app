// ignore_for_file: file_names

import 'dart:io';

// import 'package:connectivity/connectivity.dart';

// Future<bool> checkInternet() async {
//   try {
//     var result = await InternetAddress.lookup("google.com");
//     if (result.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
//   return false; // Default return in case of unexpected situations
// }

checkInternet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
//   ConnectivityResult connectionStatus = ConnectivityResult.none;

//   if (connectionStatus == ConnectivityResult.mobile) {
//   // I am connected to a mobile network.
// }
//   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//     // setState(() {
//     //   _connectionStatus = result;
//     // });
//   });
}
