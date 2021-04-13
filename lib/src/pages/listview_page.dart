import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  //metodo para inicializar antes de la construccion del widget
  @override
  void initState() { 
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){//si esta al final de la pagina
       // _agregar10();
       fetchData();
      }
    });
  }
  //el scroll guarda listeners cada vez que entra a la pantalla
  //para eso debemos desechar el scroll detruyendo la pagina

  @override
  void dispose() {
    super.dispose();
    //para prevenir fugas de memoria
    _scrollController .dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(//stack parecido a un column
      children: <Widget>[
        _crearLista(),
        _crearLoading(),
      ],
      )
    );
  }
//picsum son imagenes de relleno par hacer demostraciones
  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,//devuelve un futuro para no quedar en ciclo infinito
      child: ListView.builder(//lo envuelvo en un refresh indicator para que cargue al subir tambien
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'), 
            image: NetworkImage('https://i.picsum.photos/id/$imagen/500/400.jpg'),

            ); 
        },//redibujara los elementos necesario cuando uno no sabe cuantos elementos hay en la pagina
        ),
    );
  }

  Future<Null> obtenerPagina1() async{
    final duration = new Duration(seconds: 2);
    new Timer( duration, (){
      //purgare la lista
      _listaNumeros.clear();
      _ultimoItem++;//para que siempre salgan imagenes nuevas
      _agregar10();
    });
    return Future.delayed(duration);
  }
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _listaNumeros.add(_ultimoItem++);
    }
    setState(() {});
  }

  Future<Null> fetchData() async{
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 1);
    return new Timer( duration, respuestaHTTP);//sin parentecis en resp.. para no ejecutarlo en ese instante
  }

  void respuestaHTTP(){
    _isLoading= false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100 ,
      duration: Duration(milliseconds: 250), 
      curve: Curves.fastLinearToSlowEaseIn
      );

    _agregar10();
  }

  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,//tamanio maximo que tenga
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } return Container();//container porque siempre hay que regrsar un widget
  }

}