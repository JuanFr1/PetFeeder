//Ventana que muestra cupones en lista
//add edit

import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// import '../services/api_service.dart';
import '../model/cupon.dart';
import '../services/api_service.dart';
import 'cuponDetail.dart';
import 'dart:math';

final _random = new Random();

int next(int min, int max) => min + _random.nextInt(max - min);

class CuponPage extends StatefulWidget {
  const CuponPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CuponPageState createState() => _CuponPageState();
}

class _CuponPageState extends State<CuponPage> {
  bool isApiCallProcess = false;
  int cuponesactuales = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: Text('PULSA EN CUALQUIER PARTE DE LA PANTALLA'),
        backgroundColor: Colors.purple,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
        child: loadCupon(),
      ),
    );
  }

  Widget loadCupon() {
    print(APIService.getCupones());
    return FutureBuilder(
        future: APIService.getCupones(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Cupon>?> cupon,
        ) {
          cuponesactuales = cupon.data!.length;
          if (cupon.hasData) {
            return cuponList(cupon.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget cuponList(cupones) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cupones.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => cuponDetail(
                        cupon: cupones[next(0, cuponesactuales)],
                      )));
            },
            // child: cardCupon(index, cupones),
          );
        });
  }
}

//pagina donde se puede añadir un cupón
