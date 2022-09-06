import 'dart:convert';

import 'package:petfeeder/model/mascota.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Mascota>> listaMascotas() async {
  final response =
      await http.get(Uri.parse('http://192.168.100.19:4000/api/mascotas/'));

  return compute(decodeJson, response.body);
}

List<Mascota> decodeJson(String responseBody) {
  //aqui convertimos el body de la respuesta a json
  final myJson = json.decode(responseBody);
//convertimos json a un objeto tipo mascota
  return myJson['mascotas']
      .map<Mascota>((json) => Mascota.fromJson(json))
      .toList();
}
