import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://st.depositphotos.com/2087307/3278/i/450/depositphotos_32786225-stock-photo-angry-cat.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text('PA'),
              backgroundColor: Colors.green[300],
              foregroundColor: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://1.bp.blogspot.com/-GSuF27Q_W1E/XDdi0BXkm8I/AAAAAAAAALM/009Hki6i3N88DhqBOfrtrYOYfnqNmJcMQCLcBGAs/s1600/gatito-durmiendo-boca-arriba.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          ),
      ),
    );
  }
}