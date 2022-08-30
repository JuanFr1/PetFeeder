//Ventana donde muestra el detalle individual de cada cupon

import 'package:petfeeder/model/cupon.dart';
import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class cuponDetail extends StatelessWidget {
  final Cupon? cupon;

  cuponDetail({
    Key? key,
    this.cupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('¡Raspa para copiar el código!'),
          Text(cupon!.cuponLocal!),
          Text(cupon!.cuponBeneficio!),
          Text('Válido hasta: ' + cupon!.cuponFecha!),
          Scratcher(
              brushSize: 70,
              color: Colors.blueGrey,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cupon!.cuponCodigo!,
                      style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black),
                    ),
                  ],
                ),
                //Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(cupon.codigo.toString())),
              ))
        ],
      ),
    );
  }
}
