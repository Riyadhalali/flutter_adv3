import 'package:flutter/material.dart';
import 'package:flutter_adv3/core/service/my_services.dart';
import 'package:flutter_adv3/core/service/routes.dart';
import 'package:flutter_adv3/routes.dart';
import 'package:flutter_adv3/views/home_screen/screen/home_screen.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';


void main()  async{

  WidgetsFlutterBinding.ensureInitialized();

  // load the saved theme data
  MyService myService=MyService();
  final themeMode=await myService.getThemeMode();
  runApp(const MyApp());
  MyService();
  await initialServices();
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialBinding: InitialBinding(),
      getPages: routes,
      initialRoute: Routes.homeScreen,

    );
  }
}
