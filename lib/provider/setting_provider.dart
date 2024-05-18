import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meme_app/constants/constants.dart';

class SettingProvider with ChangeNotifier {
  List data = [];

  SettingProvider() {
    getData();
  }
  Future<void> getData() async {
    var response = await http.get(Uri.parse("$url/login"));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      data = decodedResponse;
      print(decodedResponse);
      notifyListeners();
    } else {
      throw Exception("Error to load data");
    }
  }
}
