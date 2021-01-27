import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  final url;

  Networking({@required this.url});

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

    } else {
      print('Faild');
    }
  }
}
