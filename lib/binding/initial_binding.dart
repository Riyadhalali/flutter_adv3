import 'package:get/get.dart';

import '../core/class/crud.dart';
import '../views/home_screen/controller/home_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Crud());
    Get.put(HomeController(),permanent: true);
  }
}