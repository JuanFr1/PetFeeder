import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'agregarMascotas.dart';

class listaMascotasPage extends StatefulWidget {
  static String id = 'listaMascotas';

  @override
  _listaMascotasPageState createState() => _listaMascotasPageState();
}

class _listaMascotasPageState extends State<listaMascotasPage> {
  late Map datos;
  late List petsData;
  getPets() async {
    http.Response response =
        await http.get(Uri.parse('http://localhost:4000/api/mascotas'));
    datos = json.decode(response.body);
    setState(() {
      petsData = datos['pets'];
    });
  }

  @override
  void initState() {
    super.initState();
    getPets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Mascotas"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: petsData == null ? 0 : petsData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text("$index",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(petsData[index]['avatar']),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Nombre: ",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500))),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("${petsData[index]["petName"]}",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500)))
                          ],
                        ),
                      ),
                    );
                  },
                )),
            FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => agregarMascotasPage()),
                  );
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.plus_one))
          ]),
        ));
  }
}
