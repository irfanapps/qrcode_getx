import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:qr_code_getx/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: 2,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            String title = "";
            IconData icon = Icons.ac_unit;
            VoidCallback onTapMenu = () {};

            switch (index) {
              case 0:
                title = "Qr Code";
                icon = Icons.qr_code;
                onTapMenu = () async {
                  String qrcode = await FlutterBarcodeScanner.scanBarcode(
                      "#000000", "Cancel", true, ScanMode.QR);

                  // Get.snackbar("Qr Code", qrcode,
                  //     snackPosition: SnackPosition.BOTTOM);

                  Get.toNamed(Routes.DETAIL_QRCODE, arguments: qrcode);
                };
                break;
              case 1:
                title = "Try API";
                icon = Icons.data_object;
                onTapMenu = () async {
                  String barcodes = "2";

                  Map<String, dynamic> hasil =
                      await controller.getDetailAPI(barcodes);

                  if (hasil["error"] == false) {
                    Get.toNamed(Routes.DETAIL_API, arguments: hasil['data']);
                  } else {
                    Get.snackbar("Error", hasil["message"],
                        duration: const Duration(seconds: 2));
                  }
                };
                break;
            }
            return Material(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(9),
              child: InkWell(
                onTap: onTapMenu,
                borderRadius: BorderRadius.circular(9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          icon,
                          color: Colors.black,
                          size: 50,
                        )),
                    const SizedBox(height: 5),
                    Text(title, style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.backHome(),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 10,
        shape: const CircleBorder(),
        splashColor: Colors.blue.shade900,
        focusColor: Colors.blue.shade900,
        hoverColor: Colors.blue.shade900,
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
