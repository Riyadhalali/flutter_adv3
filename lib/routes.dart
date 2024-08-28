import 'package:flutter_adv3/views/home_screen/screen/home_screen.dart';
import 'package:flutter_adv3/views/profile/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

List <GetPage<dynamic>>? routes =[


  GetPage(
      name: "/homeScreen",
      page: () => const HomeScreen()),

  GetPage(
      name: "/profileScreen",
      page: () => const ProfileScreen()),
];