import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_getx/app/routes/app_pages.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QR Code Apps",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );

  }


}