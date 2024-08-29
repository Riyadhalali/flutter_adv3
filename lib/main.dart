import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_adv3/core/service/my_services.dart';
import 'package:flutter_adv3/core/service/routes.dart';
import 'package:flutter_adv3/routes.dart';
import 'package:flutter_adv3/binding/initial_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services, including MyService
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MyService myService = Get.find<MyService>();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: myService.themeMode.value, // Use the theme mode from MyService
        initialBinding: InitialBinding(),
        getPages: routes,
        initialRoute: Routes.homeScreen,
      );
    });
  }
}
