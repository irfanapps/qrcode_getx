import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_api_controller.dart';

class DetailApiView extends GetView<DetailApiController> {
  DetailApiView({super.key});

  final dataAPI = Get.arguments;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    firstName.text = dataAPI['first_name'] ?? dataAPI['first_name'].toString();
    lastName.text = dataAPI['last_name'] ?? dataAPI['last_name'].toString();
    email.text = dataAPI['email'] ?? dataAPI['email'].toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail API'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: firstName,
              readOnly: true,
              decoration: const InputDecoration(
                  labelText: 'First Name',
                  prefixIcon: Icon(Icons.verified_user)),
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lastName,
              readOnly: true,
              decoration: const InputDecoration(
                  labelText: "Last Name",
                  prefixIcon: Icon(Icons.verified_user)),
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: email,
              readOnly: true,
              decoration: const InputDecoration(
                  labelText: "Email", prefixIcon: Icon(Icons.verified_user)),
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
