import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.purple[400],
          textColor: Colors.white,
          shape: StadiumBorder(),//bordeados bordes
          onPressed: () => _mostrarAlert(context),
          ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.label_outline, ),
        backgroundColor: Colors.purple[400],
        label: Text('salir'),
        
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(context) {
    showDialog(
      context: context,
      barrierDismissible: true,// true para salir tocando fuera el dialog
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          //content: Text('contenido'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Ahora introduce un destino..'),
              //para input
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Destino..',
                ),
                // para una entrada por defecto .. initialValue: 'Destino..',
              ),
              //para definir un logo propio
              FlutterLogo(size: 100.0,)
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed:(){
                Navigator.of(context).pop();
              }  
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed:(){
                Navigator.of(context).pop();
              }  
            )
          ],
        );
      }
      );
  }
}