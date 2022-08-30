//widgets para mostrar en la pagina

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'dart:ui';
import 'dart:core';

class Utils{
  static List<Category> getMockedCategories(){
    return[
      Category(
        color: AppColors.ACCESORIOS,
        name: "Accesorios",
        imgName: "accesorios.jpg",
        icon: IconFontHelper.ACCESORIOS,
        
      ),
      Category(
        color: AppColors.CAMAS,
        name: "Camas",
        imgName: "camas.jpg",
        icon: IconFontHelper.CAMAS,
        
      ),
      Category(
        color: AppColors.COMIDA,
        name: "Comida",
        imgName: "comida.jpg",
        icon: IconFontHelper.COMIDA,
        
      ),
      Category(
        color: AppColors.LIMPIEZA,
        name: "Limpieza",
        imgName: "limpieza.jpg",
        icon: IconFontHelper.LIMPIEZA,
        
      ),
    ];
  }
}

class IconFontHelper {
    static const String LOGO = 'a';
    static const String MAIN_LOGO = 'b';
    static const String ACCESORIOS = 'c';
    static const String CAMAS = 'd';
    static const String COMIDA = 'e';
    static const String LIMPIEZA = 'f';
}

class CategoryIcon extends StatelessWidget{
  Color color;
  String iconName;
  double size;

  CategoryIcon({required this.color, required this.iconName, this.size = 30});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: this.color,
        padding: EdgeInsets.all(10),
        child: IconFont(
          color: Colors.white,
          iconName: this.iconName,
          size: this.size,
        )
      ),
    );
  }

}

//colores personalizados
class AppColors {
  static const Color MAIN_COLOR = Color(0xFF80C038);
  static const Color ACCESORIOS = Color(0xFFC02828);
  static const Color CAMAS = Color(0xFFC028BA);
  static const Color COMIDA = Color(0xFF28C080);
  static const Color LIMPIEZA = Color(0xFFC05D28);

  // other colors
  static const Color DARK_GREEN = Color(0xFF1B6948);
  static const Color DARKER_GREEN = Color(0xFF0B452C);
  static const Color HIGHTLIGHT_DEFAULT = Color(0xFF5A8E12);
  static const Color LIGHTER_GREEN = Color(0xFFC1E09E);
}

class IconFont extends StatelessWidget{
  Color color;
  double size;
  String iconName;

  IconFont({ required this.color, required this.size, required this.iconName });

  @override 
  Widget build(BuildContext context) {
    return Text(this.iconName,
      style: TextStyle(
        color: this.color,
        fontSize: this.size,
        fontFamily: 'orilla'
      )
    );
  }
}

class CategoryCard extends StatelessWidget{
  Category category;
  Function onCardClick;

  CategoryCard({required this.category, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        this.onCardClick();
      },
      child: Container(
      margin: EdgeInsets.all(20),
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/'+this.category.imgName.toString(),
            fit: BoxFit.cover
            ),
            )
            ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent
                      ]
                      )
                      ),
                      ),
                      ),
          Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CategoryIcon(
                                color: this.category.color,
                                iconName: this.category.icon,
                                ),
                                SizedBox(width: 10),
                                Text(this.category.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25
                                  ))
                                  ],
                                  )
                                  ) 
                                  ) 
                  ],
                )
              ),
    );
  } 

  

}

class SelectedCategoryPage extends StatelessWidget{

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
      body: Container(
        child: Text('a'),
      )
    );
  }
  
}