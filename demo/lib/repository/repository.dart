import 'dart:convert';

import 'package:demo/models/photo_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<PhotoResModel> fetchPhotoRepo() async {
    http.Response response;
    Uri url = Uri.parse("https://dog.ceo/api/breeds/image/random");

    try {
      response = await http.get(url);

      var result = PhotoResModel.fromJson(jsonDecode(response.body));

      result.statusCode = response.statusCode;

      return result;
    } on http.Response catch (e) {
      throw Exception(e);
    }
  }
}
