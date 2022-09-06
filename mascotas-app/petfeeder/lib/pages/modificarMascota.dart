import '../servicios/mascota.peticion.dart';
import 'listaMascotas.dart';
import '../model/mascota.model.dart';
import 'package:flutter/material.dart';

class ModificarMascota extends StatefulWidget {
  final Mascota _pet;
  ModificarMascota(this._pet);
  @override
  State<StatefulWidget> createState() => _modificarMascota();
}

class _modificarMascota extends State<ModificarMascota> {
  late TextEditingController controllerName;
  late TextEditingController controllerAge;
  late TextEditingController controllerWeight;
  late TextEditingController controllerRaze;
  late TextEditingController controllerColor;
  late TextEditingController controllerAvatar;
  String id;

  @override
  void initState() {
    Mascota m = widget._pet;
    id = m.id;
    controllerName = new TextEditingController(text: m.petName);
    controllerAge = new TextEditingController(text: m.petAge);
    controllerWeight = new TextEditingController(text: m.petWeight);
    controllerRaze = new TextEditingController(text: m.raze);
    controllerColor = new TextEditingController(text: m.color);
    controllerAvatar = new TextEditingController(text: m.avatar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modificar Mascota"),
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
                  Mascota m = new Mascota(
                      id: id,
                      petName: name,
                      petAge: age,
                      petWeight: weight,
                      raze: raze,
                      color: color,
                      avatar: avatar);

                  updateMascota(m).then((value) => {
                        if (value.id != '') {Navigator.pop(context, value)}
                      });
                }
              },
              child: Text("Actualizar Mascota")),
        ],
      ),
    );
  }
}
