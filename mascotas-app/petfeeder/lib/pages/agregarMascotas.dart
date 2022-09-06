import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/mascota.model.dart';
import 'dart:async';
import 'dart:convert';

class agregarMascotasPage extends StatefulWidget {
  static String id = 'listaMascotas';
  @override
  State<StatefulWidget> createState() => _agregarMascotasPageState();
}

class _agregarMascotasPageState extends State<agregarMascotasPage> {
  late TextEditingController controllerName;
  late TextEditingController controllerAge;
  late TextEditingController controllerWeight;
  late TextEditingController controllerRaze;
  late TextEditingController controllerColor;
  late TextEditingController controllerAvatar;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerAge = new TextEditingController();
    controllerWeight = new TextEditingController();
    controllerRaze = new TextEditingController();
    controllerColor = new TextEditingController();
    controllerAvatar = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar Mascotas"),
        ),
        body: ListView(
          children: [
            Text("Nombre de la mascota"),
            TextField(controller: controllerName),
            Text("Edad"),
            TextField(controller: controllerAge),
            Text("Peso"),
            TextField(controller: controllerWeight),
            Text("Raza"),
            TextField(controller: controllerRaze),
            Text("Color"),
            TextField(controller: controllerColor),
            Text("URL de su foto"),
            TextField(controller: controllerAvatar),
            ElevatedButton(
                onPressed: () {
                  String name = controllerName.text;
                  String age = controllerAge.text;
                  String weight = controllerWeight.text;
                  String raze = controllerRaze.text;
                  String color = controllerColor.text;
                  String avatar = controllerAvatar.text;

                  if (name.isNotEmpty && age.isNotEmpty && weight.isNotEmpty) {
                    Navigator.pop(
                        context,
                        new Mascota(
                            petName: name,
                            petAge: age,
                            petWeight: weight,
                            raze: raze,
                            color: color,
                            avatar: avatar));
                  }
                },
                child: Text("Guardar Mascota")),
          ],
        ));
  }
}
