//packages
import 'dart:convert';
import 'package:http/http.dart' as http;

//archivos
import '../model/cupon.dart';
import '../config.dart';

class APIService {
  static var client = http.Client();

  static Future<List<Cupon>?> getCupones() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.cuponesAPI);
    // var response = await client.get(url, headers: requestHeaders);
    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return cuponesFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<bool> saveCupon(
    Cupon cupon,
  ) async {
    var cuponURL = Config.cuponesAPI;

    var url = Uri.http(Config.apiURL, Config.cuponesAPI);
    var requestMethod = "POST";
    var request = http.MultipartRequest(requestMethod, url);
    request.fields["cuponName"] = cupon.cuponName!;
    request.fields["cuponLocal"] = cupon.cuponLocal!;
    request.fields["cuponFecha"] = cupon.cuponFecha!;
    request.fields["cuponBeneficio"] = cupon.cuponBeneficio!;
    request.fields["cuponCodigo"] = cupon.cuponCodigo!;
    request.fields["cuponCategoria"] = cupon.cuponCategoria!;
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
