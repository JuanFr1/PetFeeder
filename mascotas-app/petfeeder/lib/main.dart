//Ventana principal de la app

//recursos

import 'pages/listaMascotas.dart';
import 'package:flutter/material.dart';

//ventanas

import 'pages/agregarMascotas.dart';
import 'pages/addcupon.dart';
import 'pages/cuponPrincipal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PetFeeder",
      home: HomeScreen(),
    );
  }
}

// ************ Home Screen **************
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //obtener el tamaño de la ventana
    var size = MediaQuery.of(context).size;

    //estilo
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: Color.fromARGB(255, 0, 0, 0));

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: Text('PetFeeder'),
        backgroundColor: Color.fromARGB(255, 206, 70, 81),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        //Botón que manda a Cupones

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => agregarMascotasPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/5267/5267453.png',
                                  height: 128,
                                ),
                                Text(
                                  'AgregarMascotas',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => listaMascotasPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/3460/3460335.png',
                                  height: 128,
                                ),
                                Text(
                                  'Lista Mascotas',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CuponPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://cdn-icons-png.flaticon.com/512/5470/5470197.png',
                                  height: 128,
                                ),
                                Text(
                                  'Obtener Cupón',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),

                        //Botón que manda a Correos

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              //reemplazar CuponPage() por la ventana de correos

                              MaterialPageRoute(
                                  builder: (context) => AddCuponPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  // url de imagen de internet

                                  'https://cdn-icons-png.flaticon.com/512/3703/3703714.png',
                                  height: 128,
                                ),
                                Text(
                                  'Añadir Cupoón',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
