import 'package:flutter/material.dart';
import 'package:flutter_adv3/core/service/my_services.dart';
import 'package:flutter_adv3/core/service/routes.dart';
import 'package:flutter_adv3/routes.dart';
import 'package:flutter_adv3/views/home_screen/screen/home_screen.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';


void main()  async{
  runApp(const MyApp());
  MyService();
  await initialServices();
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(),
      getPages: routes,
      initialRoute: Routes.homeScreen,

    );
  }
}
