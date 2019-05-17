import 'package:shared_preferences/shared_preferences.dart';
class sharePreference{
  static SharedPreferences preferences;

  sharePreference();

  static Future<sharePreference> getInstance() async{
    preferences = await SharedPreferences.getInstance();
    return sharePreference();
  }

  void setInt(String key, int value){
    preferences.setInt(key, value);
  }

  void setString(String key, String value){
    preferences.setString(key, value);
  }

  void setBool(String key, bool value){
    preferences.setBool(key, value);
  }

  void setList(String key, List<String> value){
    preferences.setStringList(key, value);
  }

  int getInt(String key){
    return preferences.getInt(key);
  }

  String getString(String key){
    return preferences.getString(key);
  }

  bool getBool(String key){
    return preferences.getBool(key);
  }

  List<String> getListString(String key){
    return preferences.getStringList(key);
  }
}