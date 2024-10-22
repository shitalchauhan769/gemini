import 'package:shared_preferences/shared_preferences.dart';

class Helper
{
  static Helper helper=Helper._();
  Helper._();
  void setTheme( bool theme) async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    s1.setBool("theme", theme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences s1 = await SharedPreferences.getInstance();
    bool? theme1 = s1.getBool("theme");
    return theme1;
  }
}