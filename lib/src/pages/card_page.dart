import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        backgroundColor: Colors.amber,
      ), 
      body: ListView(
        //distancia del margen
        padding: EdgeInsets.all(5.2),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo2(),
          SizedBox(height: 15.0),
          _cardTipo1(),
          SizedBox(height: 15.0),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,//sombra abajo
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.amberAccent[400],
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.language),
            title: Text('tengo hambresita'),
            subtitle: Text('Aqui esta la descripcion de la tarjeta tengp hambresita.. Aqui esta la descripcion '),
          ),
          Row(//button bar es similar alineado end
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('cancelar'),
                onPressed: () => print('cancelado'),
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () => print('ok'),
              )
            ],
          )
        ]
      ),
    );
  }

  Widget _cardTipo2(){
    final card = Container(
      //elevation: 8.0,  para card

      child: Column(
        children: <Widget>[
          //wid para modificar el loading de las imagenes
          FadeInImage(
            fadeInCurve: Curves.bounceOut,//animacion al aparecer
            placeholder: AssetImage('assets/original.gif'), 
            image: NetworkImage('https://images5.alphacoders.com/792/792976.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250,
            fit: BoxFit.cover,
            ),
          //Image(image: NetworkImage('https://images5.alphacoders.com/792/792976.jpg'),),
          Container(
            padding: EdgeInsets.all(10.0),
            child:Text('la imagen de mi sueño')
            )
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[500],
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,//negro con opacidad26
            blurRadius: 10.0,
            spreadRadius: 2.0,
            //posicion de la sombra en un cartesiano
            offset: Offset(8.0, 7.0)
          )
        ]
      ),
      child: ClipRRect(//para cortar todo lo que se encuentre fuera del contendor
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}