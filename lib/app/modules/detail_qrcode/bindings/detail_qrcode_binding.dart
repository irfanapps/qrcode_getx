import 'package:get/get.dart';

import '../controllers/detail_qrcode_controller.dart';

class DetailQrcodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailQrcodeController>(
      () => DetailQrcodeController(),
    );
  }
}
