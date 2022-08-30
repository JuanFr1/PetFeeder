import 'dart:html';
import 'package:flutter/material.dart';
import 'agregarMascotas.dart';

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
          title: Text('PetFeeder'),
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: Column(children: [
           GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => CategoryListPage()),                              
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
                                  'https://img.icons8.com/external-justicon-lineal-color-justicon/64/000000/external-coupon-black-friday-justicon-lineal-color-justicon.png',
                                  height: 128,
                                ),
                                Text(
                                  'Cupones',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),   
          // Image.asset(
          //   'assets/images/cartoon-pets.png',
          //   height: 100.0,
          // ),
          SizedBox(
            height: 15.0,
          ),
          MaterialButton(
            minWidth: 200.0,
            height: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => agregarMascotasPage()),
              );
            },
            color: Colors.lightBlue,
            child:
                Text('Agregar Mascotas', style: TextStyle(color: Colors.white)),
          ),
        ])));
  }
}
