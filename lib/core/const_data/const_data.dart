import 'dart:async';

import 'package:async/async.dart';

class ConstantData
{
static bool isLogin=false;
static String token="";
static const String map_key="";

static Future<void> updateToken()async
{

}



static Future<void> startTokenupdater() async
{
Timer.periodic(Duration(seconds: 10), (timer){
updateToken();
});
}




} // end class



