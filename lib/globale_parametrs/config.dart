import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

import 'Rtconfig.dart';

class Config{
  static String theme ="asset/Theme/theme.json";
  static String product="asset/Theme/product.json";

}
Future<Map<String, dynamic>> getParams(String jsoon) async {
  Map<String, dynamic> params = {};
  String _params = await rootBundle.loadString(jsoon);
  params = await json.decode(_params);
  RtConfig.prefs = params;
  print("parametrs from json done");
  return params;
}
Color? fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString != null) {
    if (hexString.length == 6 || hexString.length == 7){ buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
    }else return null;
  }else {
    print("null hexString finded");
    return null;}
}