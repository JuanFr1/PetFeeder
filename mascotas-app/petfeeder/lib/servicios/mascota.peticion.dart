import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/mascota.model.dart';

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

mapPet(Mascota pet, bool mapId) {
  Map map;
  //si vamos a guardar no se envia id porque es generado por la base de datos
  if (!mapId) {
    map = {
      'petName': '${pet.petName}',
      'petAge': '${pet.petAge}',
      'petWeight': '${pet.petWeight}',
      'raze': '${pet.raze}',
      'color': '${pet.color}',
      'avatar': '${pet.avatar}'
    };
  } else {
    //si vamos a modificar, enviamos objeto cliente con id

    map = {
      '_id': '${pet.id}',
      'petName': '${pet.petName}',
      'petAge': '${pet.petAge}',
      'petWeight': '${pet.petWeight}',
      'raze': '${pet.raze}',
      'color': '${pet.color}',
      'avatar': '${pet.avatar}'
    };
  }

  return map;
}

Future<Mascota> agregarMascota(Mascota mascota) async {
  var url = Uri.parse('http://192.168.100.19:4000/api/mascotas/create');
  var _body = json.encode(mapPet(mascota, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: _body);

  if (response.statusCode == 200) {
    return Mascota.fromJson(jsonDecode(response.body)['mascota']);
  } else {
    throw Exception('Error al intentar agregar la mascota');
  }
}

Future<Mascota> updateMascota(Mascota mascota) async {
  var url = Uri.parse('http://192.168.100.19:4000/api/mascotas/update');
  var _body = json.encode(mapPet(mascota, true));

  var response = await http.put(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: _body);

  if (response.statusCode == 200) {
    return Mascota.fromJson(jsonDecode(response.body)['mascota']);
  } else {
    throw Exception('Error al intentar modificar la mascota');
  }
}

Future<Mascota> eliminarMascota(String mascotaId) async {
  final response = await http.delete(
      Uri.parse('http://192.168.100.19:4000/api/mascotas/delete/$mascotaId'),
      headers: {'Content-Type': 'application/json; charset=utf-8'});
  if (response.statusCode == 200) {
    return Mascota.fromJson(jsonDecode(response.body)['mascota']);
  } else {
    throw Exception('Error al intentar eliminar la mascota');
  }
}
