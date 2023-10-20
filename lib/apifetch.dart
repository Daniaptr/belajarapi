import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiFetch {
  List data_api = [];

  // Fungsi untuk fetch api
  Future<List> getapiData() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    // karena minta tipe datanya uri jadi di ganti dulu

    if (response.statusCode == 200) {
      data_api = jsonDecode(response.body);
    } else {
      print('object');
    }
    return data_api;
  }
}
