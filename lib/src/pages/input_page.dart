import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre='';
  String _email ='';
  String _password ='';
  String _fecha='';
  String _opcionSeleccionada = 'Comprar';

  List<String> _acciones=['Comprar', 'Reservar'];

  TextEditingController _inputFieldDateController = new TextEditingController(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           title: Text('Inputs de texto', style: TextStyle(color: Colors.white, fontFamily: 'Amperzand'),),
           backgroundColor: Colors.purple,
         ),
         body: ListView(
           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
           children: <Widget>[
             _crearInput(),
             Divider(),
             _crearEmail(),
             Divider(),
             _crearPassword(),
             Divider(),
            _crearFecha( context ),
             Divider(),
             _crearDropdown(),//checkbox, select
             Divider(height: 50.0,),
            _crearPersona(),
            
           ],
         ),
       );
  }

  Widget _crearInput() {
    //texfild paravalidar un formulario 
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,//corrige por defecto
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length} '),
        hintText: 'Nombre de la persona',//sugerencia
        labelText: 'Nombre',//etiqueta de la caja
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onChanged: (valor)=>setState(() => _nombre = valor),
    );
  }

  Widget _crearEmail(){
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',//sugerencia
        labelText: 'email',//etiqueta de la caja
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )
      ),
      onChanged: (valor)=>setState(() => _email = valor),
    );
  }
  Widget _crearPassword(){
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
      onChanged: (valor) => setState(() => _password = valor),
    );
  }

  Widget _crearFecha(BuildContext context){
    return TextField(
      controller: _inputFieldDateController,
        //para no copiar informacion del cuadro
        enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: 'Salida',
        labelText: 'Elegir fecha de salida',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.date_range),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      } ,
    );
  }

  _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2020), 
      lastDate: new DateTime(2021),
      locale: Locale('es')
      );
      if(picked != null){
        setState(() {
        _fecha = picked.day.toString() +'/'+ picked.month.toString() +'/'+ picked.year.toString();
        _inputFieldDateController.text = _fecha;
      });
      }
      
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();//dinamica
    //agregar valores a la List
    _acciones.forEach((accion){
      lista.add(DropdownMenuItem(
        child: Text(accion),
        value: accion,
      ));
    });

    return lista;
  }

  Widget _crearDropdown(){

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(), 
          onChanged: (opt){
            setState(() => _opcionSeleccionada = opt );
          },
        ),
      ],
    );
  }

  Widget _crearPersona(){
    return Container(
      color: Colors.blue[200],
      child: ListTile(      
        title: Text('$_nombre'),
        subtitle: Text('Su eMail: $_email y su pass es $_password' ),
        trailing: Text('Pasaje a $_opcionSeleccionada es: '),
      ),
      
    );
  }

  
}