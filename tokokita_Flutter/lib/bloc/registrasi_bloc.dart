import 'dart:convert';

import 'package:tokokita/helper/api.dart';
import 'package:tokokita/helper/api_url.dart';
import 'package:tokokita/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? name, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;

    var body = {"name": name, "email": email, "password": password};

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
