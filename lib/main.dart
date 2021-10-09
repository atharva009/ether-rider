import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ether_rider/AllScreens/Register.dart';
import 'package:ether_rider/AllScreens/UserRole.dart';
import 'package:ether_rider/AllScreens/Login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'register': (context) => Register(),
      'userRole': (context) => UserRole()
    },
    debugShowCheckedModeBanner: false,
  ));
}
