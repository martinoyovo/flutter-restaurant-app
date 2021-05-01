import 'package:shared_preferences/shared_preferences.dart';

addNbre(int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("nbrePlats", value);
}

Future<int> getNbre(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //int keys = prefs.getInt("nbre") ?? 0;
  int value = prefs.getInt(key);
  return value;
}

/*
addQteItem(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

Future<String> getQteItem(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double keys = prefs.getDouble(key);

  return keys.toString();
}*/
