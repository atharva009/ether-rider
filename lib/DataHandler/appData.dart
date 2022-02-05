import 'package:ether_rider/Models/address.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation = new Address();

  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}
