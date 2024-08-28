import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class MyService extends GetxService {


  late SharedPreferences sharedPreferences;


  Future<MyService> init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

} // end class


initialServices() async
{
  await Get.putAsync(() => MyService().init());
}



