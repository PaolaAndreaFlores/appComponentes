import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedConteinerPage extends StatefulWidget {

  @override
  _AnimatedConteinerPageState createState() => _AnimatedConteinerPageState();
}

class _AnimatedConteinerPageState extends State<AnimatedConteinerPage> {

  double _widht  = 50.0;
  double _height = 50.0;
  Color _color   = Colors.lightBlue[300];

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container', style: TextStyle(color: Colors.black, fontFamily: 'Amperzand'), ),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),//distintivo del animated container
          //para dar efectos animados revisar curves
          curve: Curves.easeOutQuad ,
          width: _widht,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          )
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.color_lens),
          backgroundColor: Colors.lightGreen,
          // para elegir el asientooooo
          onPressed: () => _cambiarForma(), 
          ),
      );
  }

  void _cambiarForma() {
    Random random = Random();
    setState(() {
      _height = random.nextInt(300).toDouble();
      _widht = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255), 
        random.nextInt(255), 
        random.nextInt(255), 
        1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}