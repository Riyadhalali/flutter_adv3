import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MyService extends GetxService {


  late SharedPreferences sharedPreferences;


  Future<MyService> init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }


  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('themeMode') ?? 0; // Default to system mode
    return ThemeMode.values[themeIndex];
  }

  // Method to save the theme mode to SharedPreferences
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeMode.index);
  }




} // end class


initialServices() async
{
  await Get.putAsync(() => MyService().init());
}



