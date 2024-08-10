//import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isHidden = false.obs;
  RxBool rememberMe = false.obs;

  void login() async {
    if (emailC.text == 'admin@test.com' && passC.text == 'admin123') {
      final box = GetStorage();
      if (box.read("datarememberme") != null) {
        box.remove("datarememberme");
      }
      box.write(
          "datarememberme", {"email": emailC.text, "password": passC.text});

      Get.snackbar("Login Success", "Success");
      Get.offAllNamed('/home');
    } else {
      Get.snackbar("not match", "Email and password not match");
    }
  }

  void logout() async {
    Get.snackbar("Logout Success", "Success");
  }
}
