import 'dart:io';

// import 'package:petfeeder/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:petfeeder/model/cupon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snippet_coder_utils/FormHelper.dart';



class AddCuponPage extends StatefulWidget{
  const AddCuponPage({Key? key}) : super(key: key);

  @override
  _AddCuponPage createState() => _AddCuponPage();
}

class _AddCuponPage extends State<AddCuponPage>{
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  Cupon ? cupon;
  //bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: barraSuperior(),
        backgroundColor: Colors.grey[200],
        body: ModalProgressHUD(
          child: Form(
            key: globalKey,
            child: cuponForm(),
          ),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      )
    );
  }

  @override
  void initState(){
    super.initState();
    cupon = Cupon();

    Future.delayed(Duration.zero, (){
      if(ModalRoute.of(context)?.settings.arguments != null){
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        cupon = arguments['cupon'];
        setState(() {
          
        });
      }
    });

  }

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
  // formulario a llenar por el user
  Widget cuponForm(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //cada campo a llenar es un padding
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponName", 
              "cuponName",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSavedVal){
                cupon!.cuponName = onSavedVal;
              },
                initialValue: cupon!.cuponName ?? "",
                obscureText: false,
                borderColor: Colors.grey,
                borderFocusColor: Colors.black,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(0.7),
                borderRadius: 10,
                showPrefixIcon: false,                
              )
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponLocal", 
              "Local donde puedo reclamar el cupón",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSavedVal){
                //añadir accion on Saved
                cupon!.cuponLocal = onSavedVal;
              },
              initialValue: cupon!.cuponLocal ?? "",
              obscureText: false,
              borderColor: Colors.grey,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,                
              )
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponFecha", 
              "Valido hasta",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSaved){
                //añadir accion on Saved
                cupon!.cuponFecha = onSaved;
              },
              initialValue: cupon!.cuponFecha ?? "",
              obscureText: false,
              borderColor: Colors.grey,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,                
              )
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponBeneficio", 
              "Descripción y restricciones",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSaved){
                cupon!.cuponBeneficio = onSaved;
                //añadir accion on Saved
              },
                initialValue: cupon!.cuponBeneficio ?? "",
              obscureText: false,
              borderColor: Colors.grey,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,               
              )
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponCodigo", 
              "Código de promoción",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSaved){
                //añadir accion on Saved
                cupon!.cuponCodigo = onSaved;
              },
                initialValue: cupon!.cuponCodigo ?? "",
              obscureText: false,
              borderColor: Colors.grey,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,                 
              )
            ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
              top: 10
            ),
            child: FormHelper.inputFieldWidget(
              context, 
              const Icon(Icons.ac_unit),
              "cuponCategoria", 
              "Categoría",
              (onValidate){
                if(onValidate.isEmpty){
                  return "Este campo no puede estar vacío";
                }
                return null;
              }, 
              (onSaved){
                //añadir accion on Saved
                cupon!.cuponCategoria = onSaved;
              },
                initialValue: cupon!.cuponCategoria ?? "",
              obscureText: false,
              borderColor: Colors.grey,
              borderFocusColor: Colors.black,
              textColor: Colors.black,
              hintColor: Colors.black.withOpacity(0.7),
              borderRadius: 10,
              showPrefixIcon: false,              
              )
            ),
          Center(
            child: formSubmit(),
          ),
            //aqui va el image picker
        ],
      )
    );
  }

  //boton para subir los datos del form
  Widget formSubmit(){
    return 
    FormHelper.submitButton(
      "Añadir Cupón", 
      (){
        //ontap actions
        if(validateAndSave()){
          print(cupon!.toJson());
          setState(() {
            isAPICallProcess = true;
          });
          APIService.saveCupon(cupon!).then(
            (response){
              setState(() {
                isAPICallProcess = false;
              });
              if(response){
                Navigator.pushNamedAndRemoveUntil(
                  context, 
                  '/', 
                  (route) => false
                  );
              }else{
                FormHelper.showSimpleAlertDialog(
                  context, 
                  Config.appName, 
                  "An error ocurred", 
                  "OK", 
                  (){
                    Navigator.of(context).pop();
                  });
              }
            });
          }
        },
      btnColor: Colors.amber,
      borderColor: Colors.transparent,
      txtColor: Colors.black,
      );
  }
  
  //validar que los campos no están vacíos
  bool validateAndSave(){
    final form = globalKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }

  isValidURL(url){
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }


  // hacer un image picker
  // corregir este bloque de codigo
  // static Widget picPicker(
  //   bool isFileSelected,
  //   String fileName,
  //   Function onFilePicked,
  // ){
  //   // importar modulos Xfile & ImagePIcker
  //   Future<Xfile?> _imageFile;
  //   ImagePicker _picker = ImagePicker();

  //   return Column(
  //     children: [
  //       fileName.isNotEmpty ?
  //       isFileSelected ? Image.file(File(filename), height: 200, width: 200, fit: BoxFit.scaleDown,),)
  //       : SizedBox(child: Image.network(filename, width: 200, height: 200, fit: BoxFit.scaleDown,)
  //     ],
  //   );
  // }
  
}

