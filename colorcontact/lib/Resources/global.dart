library my_prj.globals;

import 'dart:ui';

import 'package:colorcontact/Resources/Images.dart';


// Variables
var ap;
var lp;

var color1 = Color(0xFF63C184);
var color2 = Color(0xFF9D44FC);
var color3 = Color(0xFFFEAC43);
var color4 = Color(0xFFF45151);


// Calses
class Contacto{

  String nombres;
  String apellidos;
  String celular;
  String celular2;

  String cumpleanos;

  var color = color2;

  var imagen = contactoVector();

  Contacto(this.nombres, this.celular);

}


// Instancias
List<Contacto> contactos = new List<Contacto>();
