import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_qrcode_controller.dart';

class DetailQrcodeView extends GetView<DetailQrcodeController> {
  DetailQrcodeView({super.key});
  final dataQrCode = Get.arguments;

  final TextEditingController dataQrCodes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dataQrCodes.text = dataQrCode ?? dataQrCode.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail QR Code'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: dataQrCodes,
              readOnly: true,
              decoration: const InputDecoration(
                  labelText: 'Qr Code', prefixIcon: Icon(Icons.qr_code)),
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
