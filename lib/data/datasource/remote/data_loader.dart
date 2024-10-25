import 'dart:convert';
import 'package:flutter/services.dart';

Future<String> loadJsonData() async {
  String jsonString = await rootBundle.loadString('assets/data.json');
  return jsonString;
}

Future<void> main() async {
  String jsonData = await loadJsonData();
  // Do something with the JSON data
}