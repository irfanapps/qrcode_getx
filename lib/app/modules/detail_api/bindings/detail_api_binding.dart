import 'package:get/get.dart';

import '../controllers/detail_api_controller.dart';

class DetailApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailApiController>(
      () => DetailApiController(),
    );
  }
}
