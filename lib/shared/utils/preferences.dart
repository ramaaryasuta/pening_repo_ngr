import 'package:shared_preferences/shared_preferences.dart';

Future<bool> setIsLogged(bool v) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.setBool('isLogged', v);
}

Future<bool> getIsLogged() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLogged') ?? false;
}
