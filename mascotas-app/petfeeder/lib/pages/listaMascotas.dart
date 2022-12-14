import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../servicios/mascota.peticion.dart';
import 'message-response.dart';
import '../model/mascota.model.dart';
import 'agregarMascotas.dart';
import 'modificarMascota.dart';

class listaMascotasPage extends StatefulWidget {
  static String id = 'listaMascotas';

  @override
  _listaMascotasPageState createState() => _listaMascotasPageState();
}

class _listaMascotasPageState extends State<listaMascotasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          title: Text('Lista Mascotas'),
          backgroundColor: Color.fromARGB(255, 206, 70, 81),
        ),
        body: Center(
          child: Column(children: [
            getPets(context, listaMascotas()),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => agregarMascotasPage()))
                          .then((newMascota) {
                        setState(() {
                          messageResponse(context,
                              newMascota.petName + " ha sido agregada");
                        });
                      });
                    },
                    tooltip: "Agregar Mascota",
                    backgroundColor: Color.fromARGB(255, 206, 70, 81),
                    child: const Icon(Icons.add)))
          ]),
        ));
  }
}

Widget getPets(BuildContext context, Future<List<Mascota>> futurePet) {
  return FutureBuilder(
    future: futurePet,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) {
            return Container(
                alignment: Alignment.center,
                child: Center(child: Text("Error: ${snapshot.error}")));
          }
          return (snapshot.data != null)
              ? petList(snapshot.data)
              : Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text("Sin datos"),
                  ));
        default:
          return Text('Recargar pagina');
      }
    },
  );
}

Widget petList(List<Mascota> mascotas) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: mascotas.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModificarMascota(mascotas[index])))
              .then((newMascota) {
            messageResponse(
                context, newMascota.petName + " Ha sido modificado...!");
          });
        },
        onLongPress: () {
          removeMascota(context, mascotas[index]);
        },
        title: Text(mascotas[index].petName),
        subtitle: Text(mascotas[index].petAge),
        leading: CircleAvatar(
          child: Text(mascotas[index].petName.substring(0, 1)),
        ),
      );
    },
  );
}

removeMascota(BuildContext context, Mascota mascota) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Eliminar Mascota"),
            content: Text("Esta seguro de eliminar a " + mascota.petName + "?"),
            actions: [
              TextButton(
                onPressed: () {
                  eliminarMascota(mascota.id).then((value) => {
                        if (value.id != '') {Navigator.pop(context)}
                      });
                },
                child: Text(
                  "Eliminar",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(color: Color.fromARGB(255, 208, 216, 98)),
                ),
              )
            ],
          ));
}
