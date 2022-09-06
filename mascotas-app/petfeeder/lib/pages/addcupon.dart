import 'dart:io';

import 'package:flutter/material.dart';
import '../model/cupon.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../config.dart';
import '../servicios/api_service.dart';

class AddCuponPage extends StatefulWidget {
  const AddCuponPage({Key? key}) : super(key: key);

  @override
  _AddCuponPage createState() => _AddCuponPage();
}

class _AddCuponPage extends State<AddCuponPage> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  Cupon? cupon;
  //bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
        title: Text('AÑADA SU CUPON'),
        backgroundColor: Color.fromARGB(255, 206, 70, 81),
      ),
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
    ));
  }

  @override
  void initState() {
    super.initState();
    cupon = Cupon();

    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        cupon = arguments['cupon'];
        setState(() {});
      }
    });
  }

  // formulario a llenar por el user
  Widget cuponForm() {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //cada campo a llenar es un padding
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponName",
              "Nombre del Cupon",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSavedVal) {
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
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponLocal",
              "Establecimiento donde se aplicará el cupon",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSavedVal) {
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
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponFecha",
              "Fecha de Expiración",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSaved) {
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
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponBeneficio",
              "Descripción",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSaved) {
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
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponCodigo",
              "Código",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSaved) {
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
            )),
        Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.ac_unit),
              "cuponCategoria",
              "Categoría",
              (onValidate) {
                if (onValidate.isEmpty) {
                  return "Este campo no puede estar vacío";
                }
                return null;
              },
              (onSaved) {
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
            )),
        Center(
          child: formSubmit(),
        ),
      ],
    ));
  }

  //boton para subir los datos del form
  Widget formSubmit() {
    return FormHelper.submitButton(
      "Añadir Cupón",
      () {
        //ontap actions
        if (validateAndSave()) {
          print(cupon!.toJson());
          setState(() {
            isAPICallProcess = true;
          });
          APIService.saveCupon(cupon!).then((response) {
            setState(() {
              isAPICallProcess = false;
            });
            if (response) {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            } else {
              FormHelper.showSimpleAlertDialog(
                  context, Config.appName, "An error ocurred", "OK", () {
                Navigator.of(context).pop();
              });
            }
          });
        }
      },
      btnColor: Color.fromARGB(255, 206, 70, 81),
      borderColor: Colors.transparent,
      txtColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  isValidURL(url) {
    return Uri.tryParse(url)?.hasAbsolutePath ?? false;
  }
}
