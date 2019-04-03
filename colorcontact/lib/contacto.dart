import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:colorcontact/Resources/global.dart' as global;



class ContactoView extends StatefulWidget{

  var contacto;

  ContactoView( this.contacto );

  @override
  createState() {
    return new _contactoViewState();
  }

}
class _contactoViewState extends State<ContactoView>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(

          leading: Container(margin: EdgeInsets.fromLTRB(15, 20, 0, 0) ,alignment: Alignment.centerLeft, child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context); })),
          title: Container( margin: EdgeInsets.fromLTRB(15, 20, 0, 0) ,alignment: Alignment.centerLeft, child: Text( widget.contacto.nombres, style: TextStyle(fontFamily: "Cera Bold", fontSize: 25),)),
          backgroundColor: Colors.black,
          actions: <Widget>[],
        ),
      ),

      body: Container(

        height: global.lp - 135 ,
        width: global.ap,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            // Aqui agregar los datos del contacto
            Container(



            ),


            GestureDetector(
              onTap: (){
                setState(() {
                  global.contactos.remove(widget.contacto);
                  Navigator.pop(context);
                });
              },

              child: Container(

                alignment: Alignment.center,
                width: global.ap,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),

                child: Container(

                  width: global.ap *0.6,
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(

                      color: global.color4,
                      borderRadius: BorderRadius.all(Radius.circular(20))

                  ),

                  child: Text("Eliminar", style: TextStyle( fontFamily: "Cera Bold", fontSize: 22, color: Colors.white ) ),

                ),
              ),
            ),
          ],

        ),

      ),

    );
  }



}