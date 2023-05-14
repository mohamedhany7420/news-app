import 'package:shared_preferences/shared_preferences.dart';

class cashHelper{
 static SharedPreferences sharedpreferences = cashHelper.sharedpreferences;
 static init () async
 {
  sharedpreferences= await SharedPreferences.getInstance();
 }
 static Future<bool> putBool({required String key, required bool value}) async{
  return await sharedpreferences.setBool(key, value);
 }
static bool? getBool({required String key}) {
  return  sharedpreferences.getBool(key);
 }
}