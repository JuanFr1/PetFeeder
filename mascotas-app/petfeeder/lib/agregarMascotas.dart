import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class agregarMascotasPage extends StatefulWidget {
  static String id = 'agregarMascotas';

  @override
  _agregarMascotasPageState createState() => _agregarMascotasPageState();
}

class _agregarMascotasPageState extends State<agregarMascotasPage> {
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
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("$index",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500))),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(petsData[index]['avatar']),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("${petsData[index]["petName"]}"))
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ]),
        ));
  }
}
