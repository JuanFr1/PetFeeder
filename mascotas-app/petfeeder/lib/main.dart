import 'dart:html';
import 'package:flutter/material.dart';
import 'pages/agregarMascotas.dart';
import 'pages/listaMascotas.dart';
import 'pages/addcupon.dart';
import 'pages/cuponPrincipal.dart';

void main() {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          title: Text('PETFEEDER'),
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: Column(children: [
          Image.asset(
            'assets/images/cartoon-pets.png',
            height: 100.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => listaMascotasPage()),
              );
            },
            color: Colors.lightBlue,
            child: Text('Mascotas', style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CuponPage()),
              );
            },
            color: Colors.lightBlue,
            child:
                Text('Obtenga un Cupon', style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCuponPage()),
              );
            },
            color: Colors.lightBlue,
            child: Text('Agregar Cupon', style: TextStyle(color: Colors.white)),
          )
        ])));
  }
}
