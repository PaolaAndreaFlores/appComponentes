//aqui manejaremos especificamente al json

import 'package:flutter/services.dart' show rootBundle; //rootbundle tiene par leer json

import 'dart:convert';

 class _MenuProvider{
  List<dynamic> opciones = [];
  _MenuProvider() {
   // cargarData(); //future bilder para llamarlo
  }

   Future<List<dynamic>> cargarData() async { //regresara un futuro
    final resp = await rootBundle.loadString('data/menu_opts.json');
    
      Map dataMap = json.decode(resp);
     // print(dataMap['rutas']);
      opciones = dataMap['rutas'];

    return opciones;
   }
 }
// creando la instancia
final menuProvider = new _MenuProvider(); //solo expondra la instancia creada del menu
