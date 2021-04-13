
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Trans. Bustillo', style: TextStyle(fontFamily: 'Amperzand', fontSize: 30.0),),
       centerTitle: true,
       backgroundColor: Colors.indigo,
     ),
     body: _lista(),
   );
  }

  Widget _lista() {
    
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],//correccion al error de _listaItems
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
          children: _listaItems(snapshot.data, context),

        );
      },
    );
  }

  List<Widget> _listaItems( List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt){

      final widgetTemp = ListTile(
        title: Text(opt ['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        //forma tradicional con push para colocar encima, el contex sabe cual pag sigue
        onTap: (){
          //      **navegando con rutas sin nombre
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );
          // Navigator.push(context, route);

          //      **navegando con rutas con nombre => para multiples rutas en una pagina
          // definir el named de rutas en el main
          Navigator.pushNamed(context, opt['ruta']);
        },

      );
    opciones..add(widgetTemp)
            ..add(Divider());
    });
    return opciones;
  }
}