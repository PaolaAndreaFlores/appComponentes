//una utilidad en un metodo que sera utilizado en avatars cards o cualquier otro lugar



import 'package:flutter/material.dart';


//sintaxis para definir un mapa <String, IconData>{};
final _icons = <String, IconData>{
  'add_alert'          : Icons.add_alert,
  'accessibility'      : Icons.accessibility,
  'folder_open'        : Icons.folder_open,
  'play_circle_filled' : Icons.play_circle_filled,
  'input'              : Icons.input,
  'slider'             : Icons.tune,
  'list'               : Icons.list
};
Icon getIcon(String nombreIcono){
  return Icon(_icons[nombreIcono], color: Colors.amber,);
}