import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllGets {
  AllGets({url});
  final String url = "";

  getURl(url) async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      debugPrint("call sucessful");
      var data = response.body;
      return jsonDecode(data);
    } else {
      debugPrint("call unsuccessful");
      debugPrint(
        response.statusCode.toString(),
      );
    }
  }
}
