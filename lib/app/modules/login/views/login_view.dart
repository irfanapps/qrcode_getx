import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_getx/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final LoginController loginC = Get.put(LoginController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    if (box.read("datarememberme") != null) {
      loginC.emailC.text = box.read("datarememberme")['email'];
      loginC.passC.text = box.read("datarememberme")['password'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Apps"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(9),
        children: [
          TextField(
            controller: loginC.emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                labelText: "Email",
                prefix: Icon(Icons.email),
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 8.0),
          TextField(
            controller: loginC.passC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
                labelText: "Password",
                prefix: Icon(Icons.lock),
                contentPadding: EdgeInsets.all(8.0),
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 9.0),
          CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              title: const Text("Remember Me"),
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              onChanged: (Value) {}),
          const SizedBox(height: 8.0),
          ElevatedButton(
              onPressed: () => loginC.login(), child: const Text("Login"))
        ],
      ),
    ); // Implement your UI here
  }
}
