import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),  
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              ),
            
          ],
        ),
      ),
    );
  }

  Widget  _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 350.0,
      // label: 'Tamaño de la imagen',//funciona solo con divisions
      // divisions: 20, // comento para que no sea brusco el aumento
      activeColor: Colors.indigoAccent,
      onChanged: (_bloquearCheck) ? null : (value){
        setState(() => _valorSlider = value);
        
      });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/00/f5/47/00f54793b969f201229e5ba6dc41ed35.png'), 
      width: _valorSlider,
      fit: BoxFit.contain,//para ur la imagen no se salga de sus margenes
      );
  }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck, 
    //   onChanged: (valor){
    //     setState(() {
    //      _bloquearCheck = valor;
    //     });
    //   });

    // el siguiente es similar pero con titulo
    return CheckboxListTile(
    title: Text('Bloquear Slider'),      
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
         _bloquearCheck = valor;
        });
      });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
    title: Text('Bloquear Slider'),      
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
         _bloquearCheck = valor;
        });
      });
  }
}