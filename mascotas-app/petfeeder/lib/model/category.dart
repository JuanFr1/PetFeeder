//ventana que muestra las categorias
//list

import 'package:pages/addcupon.dart';
import 'package:flutter/material.dart';

class Category {
  late String name;
  late String icon;
  late Color color;
  late String imgName;

  Category({
    required this.name,
    required this.icon,
    required this.color,
    required this.imgName,
  });
}

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();
  var cardTextStyle = TextStyle(
      fontFamily: "Montserrat Regular",
      fontSize: 14,
      color: Color.fromRGBO(63, 63, 63, 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: Drawer(),
        appBar: AppBar(
          leading: BackButton(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  'Seleccione una categoría',
                  textAlign: TextAlign.center,
                  style: cardTextStyle,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return CategoryCard(
                      category: categories[index],
                      onCardClick: () {
                        //link a la respectiva pantalla
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CuponPage()),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
