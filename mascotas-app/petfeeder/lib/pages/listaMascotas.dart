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
          title: Text("Lista de Mascotas"),
          backgroundColor: Colors.purple,
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
                        if (newMascota != null) {
                          setState(() {
                            messageResponse(context,
                                newMascota.petName + "ha sido agregada");
                          });
                        }
                      });
                    },
                    tooltip: "Agregar Mascota",
                    backgroundColor: Colors.blue,
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
    itemCount: mascotas.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModificarMascota(mascotas[index])))
              .then((newMascota) {
            if (newMascota != null) {
              mascotas.removeAt(index);

              mascotas.insert(index, newMascota);

              messageResponse(
                  context, newMascota.petName + " Ha sido modificado...!");
            }
          });
        },
        onLongPress: () {
          eliminarMascota(context, mascotas[index]);
        },
        title: Text(mascotas[index].petName),
        subtitle: Text(mascotas[index].petAge +
            mascotas[index].petWeight +
            mascotas[index].color),
        leading: CircleAvatar(
          child: Text(mascotas[index].petName.substring(0, 1)),
        ),
      );
    },
  );
}

eliminarMascota(BuildContext context, Mascota mascota) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Eliminar Mascota"),
            content: Text("Esta seguro de eliminar a " + mascota.petName + "?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ));
}
