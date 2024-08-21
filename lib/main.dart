import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initial_binding.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
