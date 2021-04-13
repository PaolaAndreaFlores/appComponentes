import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';

Map<String,WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
    '/'      : (BuildContext context) => HomePage(),
    'alert'  : (BuildContext context) => AlertPage(),
    AvatarPage.pageName : (BuildContext context) => AvatarPage(),
    'card'              : (context) => CardPage(),
    'animatedContainer' : (context) => AnimatedConteinerPage(),
    'inputs'            : (context) => InputPage(),
    'sliders'           : (context) => SliderPage(),
    'list'              : (context) => ListaPage()
  };
}
