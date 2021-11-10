import 'package:ether_rider/Screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ether_rider/Screens/Register.dart';
import 'package:ether_rider/Screens/UserRole.dart';
import 'package:ether_rider/Screens/Login.dart';
import 'package:ether_rider/Screens/Map.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'register': (context) => Register(),
      'userRole': (context) => UserRole(),
      'map': (context) => Map(),
      'searchScreen': (context) => SearchScreen()
    },
    debugShowCheckedModeBanner: false,
  ));
}
