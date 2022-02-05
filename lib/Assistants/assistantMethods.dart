//import 'dart:js';

import 'package:ether_rider/Assistants/requestAssistant.dart';
import 'package:ether_rider/DataHandler/appData.dart';
import 'package:ether_rider/Models/address.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(
      Position position, context) async {
    String placeAddress = "";
    String str1, str2, str3, str4;
    String url =
        'https://discover.search.hereapi.com/v1/discover?at=${position.latitude},${position.longitude}&q=petrol+station&limit=5'; //enter url(here api)

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed" && response["results"].isNotEmpty) {
      // placeAddress = response["results"][0]["formatted_address"];  here api // not good looking
      // placeAddress = response["results"][0]["formatted_address"]; sliced pretty format here

      //placeAddress = str1 + ", " + str2 + ", " + str3 + ", " + str4; formatted address; each to be defined

      Address userPickUpAddress = new Address();
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    } else {
      placeAddress = "Error in retrieving address info";
    }

    return placeAddress;
  }
}
