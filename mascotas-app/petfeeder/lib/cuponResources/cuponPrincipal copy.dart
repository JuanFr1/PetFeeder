// //Ventana que muestra cupones en lista
// //add edit

// import 'package:animalfav/cuponResources/cuponDetail.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' as rootBundle;
// import 'package:animalfav/cuponResources/cupon.dart';

// class CuponPage extends StatefulWidget{
//   @override
//   _CuponPageState createState() => _CuponPageState();
// }

// class _CuponPageState extends State<CuponPage>{
//   List<Cupon> cupones = List<Cupon>.empty(growable: true);
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//       ),
//       body: listWidget()
//     );
//   }

// //widget que contiene cada card en la lista
// Widget cardCupon(index, items){
//     return Card(
//                   elevation: 5,
//                   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   child: Container(
//                     padding: EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50                          
//                         ),
//                         Expanded(child: Container(
//                           padding: EdgeInsets.only(bottom: 8),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].cuponName.toString(), style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold
//                               ),),),
//                               Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].local.toString()),),
//                               Padding(padding: EdgeInsets.only(left: 8, right: 8), child: Text(items[index].beneficio.toString()),),
//                             ],
//                           ),
//                         )
//                         )
//                       ]
//                     ),
                    
//                   ),
//                 )
//     ;
//   }

// //widget que lee el json y arma la lista
// Widget listWidget(){
//   return FutureBuilder(
//         future: ReadJsonData(),
//         builder: (context, data){
//           if(data.hasError){
//             return Center(child: Text("${data.error}"));
//           }else if(data.hasData){
//             var items = data.data as List<Cupon>;
//             return ListView.builder(
//               itemCount: items == null? 0: items.length,
//               itemBuilder: (context, index){
//                 return GestureDetector(
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>cuponDetail(cupon: items[index],)));
//                   },
//                   child: cardCupon(index, items), //card que muestra cada cupon
//                 );
//               }
//             );
//           }else{
//             return Center(child: CircularProgressIndicator(),);
//           }
//         },
//       )
//   ;
// }


// Future<List<Cupon>> ReadJsonData() async{
//     final jsondata = await rootBundle.rootBundle.loadString('data/cupones.json');
//     final list = json.decode(jsondata) as List<dynamic>;
//     return list.map((e) => Cupon.fromJson(e)).toList();
//   }
// }

