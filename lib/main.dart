import 'package:ether_rider/DataHandler/appData.dart';
import 'package:ether_rider/Screens/CarInfoScreen.dart';
import 'package:ether_rider/Screens/SearchScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ether_rider/Screens/Register.dart';
import 'package:ether_rider/Screens/UserRole.dart';
import 'package:ether_rider/Screens/Login.dart';
import 'package:ether_rider/Screens/Map.dart';
import 'package:provider/provider.dart';


//firebase trial
  DatabaseReference usersRef = FirebaseDatabase.instance.reference().child("users");
  //
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  

  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AppData(),
    child: MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'userRole': (context) => UserRole(),
        'map': (context) => Map(),
        'searchScreen': (context) => SearchScreen(),
        'carInfo': (context) => CarInfoScreen(),
        CarInfoScreen.idScreen: (context) =>CarInfoScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  ));
}
