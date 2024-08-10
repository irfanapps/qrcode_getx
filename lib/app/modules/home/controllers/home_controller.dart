import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as myhttp;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  Future<Map<String, dynamic>> getDetailAPI(String barcode) async {
    try {
      var hasil =
          await myhttp.get(Uri.parse("https://reqres.in/api/users/$barcode"));

      Map<String, dynamic> jsonData = await jsonDecode(hasil.body);

      if (jsonData['data']["email"] != null &&
          jsonData['data']["email"].isNotEmpty) {
        return {
          "error": false,
          "message": "Success Get Data API",
          "data": jsonData['data']
        };
      } else {
        return {"error": true, "message": "Failed Get Data API"};
      }
    } catch (e) {
      return {"error": true, "message": "Failed Get Data"};
    }
  }

  void backHome() {
    Get.offAllNamed('/login');
  }
}
