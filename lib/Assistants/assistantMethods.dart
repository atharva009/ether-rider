import 'package:ether_rider/Assistants/requestAssistant.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String url =
        "https://api.positionstack.com/v1/reverse?access_key=2d0edb0734f2cdfe207995d19c459b82&query=${position.latitude},${position.longitude}";

    var response = await RequestAssistant.getRequest(url);

    if (response != "failed" && response["results"].isNotEmpty) {
      placeAddress = response["results"][0]["name"];
    } else {
      placeAddress = "Error in retrieving address info";
    }

    return placeAddress;
  }
}
