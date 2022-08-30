//Ventana que muestra cupones en lista
//add edit

import 'package:animalfav/pages/cuponDetail.dart';
import 'package:flutter/material.dart';
import 'package:animalfav/model/cupon.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../services/api_service.dart';
import 'addcupon.dart';

class CuponPage extends StatefulWidget{
  const CuponPage({Key? key}) : super(key: key);

  @override
  _CuponPageState createState() => _CuponPageState();
}

class _CuponPageState extends State<CuponPage>{
  //List<Cupon> cupones = List<Cupon>.empty(growable: true);

  bool isApiCallProcess = false;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return 
    Scaffold(
      floatingActionButton: botonFlotante(),
      appBar: barraSuperior(),
      body: ModalProgressHUD(
        child: loadCupon(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),        
      ),
    );
  }

//widget que contiene cada card en la lista
Widget cardCupon(index, cupones){
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50  
                          //aqui puede ir una imagen                        
                        ),
                        Expanded(child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Column( //columna de la info de cada cupon
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(cupones[index].cuponName.toString(), style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(cupones[index].local.toString()),),
                              Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(cupones[index].beneficio.toString()),),
                            ],
                          ),
                        )
                        ),
                      ]
                    ),
                    
                  ),
      )
    ;
  }

//boton flotante
Widget botonFlotante(){
  return SpeedDial(
    animatedIcon: AnimatedIcons.menu_close,
    backgroundColor: Colors.white, //color del boton
    overlayColor: Colors.black, //color cuando doy click
    overlayOpacity: 0.4,
    children: [
      SpeedDialChild(
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        label: 'Añadir Cupón',
        onTap: () => {
          //pagina de añadir cupon
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCuponPage()))
          },
      ),
    ],
  )
  ;
}

//barra superior que se muestra
PreferredSizeWidget barraSuperior(){
  return AppBar(
        leading: BackButton(),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      )
  ;
}


Widget loadCupon(){
  return FutureBuilder(
    future: APIService.getCupones(),
    builder: (
      BuildContext context,
      AsyncSnapshot<List<Cupon>?> cupon,
    ){
      if(cupon.hasData){
        return cuponList(cupon.data);
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  );
}

Widget cuponList(cupones){
  return ListView.builder(
    shrinkWrap: true,
    itemCount: cupones.length,
    itemBuilder: (context, index){
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cuponDetail(cupon: cupones[index],)));
        },
        child: cardCupon(index, cupones),
      );
    });
}
}

//pagina donde se puede añadir un cupón
