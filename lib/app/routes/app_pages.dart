import 'package:get/get.dart';

import '../modules/detail_api/bindings/detail_api_binding.dart';
import '../modules/detail_api/views/detail_api_view.dart';
import '../modules/detail_qrcode/bindings/detail_qrcode_binding.dart';
import '../modules/detail_qrcode/views/detail_qrcode_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
      name: _Paths.DETAIL_API,
      page: () => DetailApiView(),
      binding: DetailApiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_QRCODE,
      page: () => DetailQrcodeView(),
      binding: DetailQrcodeBinding(),
    ),
  ];
}
