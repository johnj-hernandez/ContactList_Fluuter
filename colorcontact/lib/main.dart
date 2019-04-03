import 'package:colorcontact/Resources/Images.dart';
import 'package:colorcontact/contacto.dart';
import 'package:flutter/material.dart';
import 'package:colorcontact/Resources/global.dart' as global;

void main() => runApp(ColorContact());

class ColorContact extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis Contactos',
      home: InicioView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InicioView extends StatefulWidget {
  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  // Funcion que hace un refresh de los cambios
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    global.ap = MediaQuery.of(context).size.width;
    global.lp = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Container(
              margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Color Contact",
                style: TextStyle(fontFamily: "Cera Bold", fontSize: 25),
              )),
          backgroundColor: Colors.black,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            String name = "";
            String cel = "";

            showDialog(
                context: context,
                builder: (BuildContext context) {

                  return AlertDialog(
                    title: Text("Datos de Contacto"),
                    content: Column(
                      children: <Widget>[
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                          ),
                          onChanged: (value) {
                            name = value.toString();
                          },
                        ),
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'celular',
                          ),
                          onChanged: (value) {
                            cel = value.toString();
                          },
                        )
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text("OK"),
                        onPressed: (){
                          global.Contacto c1 = new global.Contacto(name, cel);
                          global.contactos.add(c1);
                          Navigator.of(context).pop(context);
                        },
                      )
                    ],
                  );

                });
          });
        },
        child: Container(width: 20, height: 20, child: masVector()),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: Center(
                          child: ListViewContactos(notifyParent: refresh)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Lista de Contactos
class ListViewContactos extends StatefulWidget {
  final Function() notifyParent;
  ListViewContactos({Key key, @required this.notifyParent}) : super(key: key);

  @override
  createState() {
    return new _listViewContactosState();
  }
}

class _listViewContactosState extends State<ListViewContactos> {
  var contactos = global.contactos;

  @override
  Widget build(BuildContext context) {
    if (contactos.length >= 1) {
      return Container(
        width: global.ap * 0.85,
        alignment: Alignment.topCenter,
        height: global.lp - 135,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: ListView.builder(
            primary: false,
            shrinkWrap: false,
            itemCount: contactos.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 90,
                width: global.ap * 0.8,
                margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                decoration: BoxDecoration(
                  color: contactos[index].color,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: ListTile(
                      key: UniqueKey(),
                      title: Text(
                        contactos[index].nombres,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: "Cera Bold"),
                      ),
                      subtitle: Text(contactos[index].celular,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Cera Light",
                              fontStyle: FontStyle.italic)),
                      leading: Container(
                          width: 60,
                          height: 60,
                          child: contactos[index].imagen),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ContactoView(contactos[index])),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
      );
    } else {
      return Container(
        width: global.ap,
        height: global.lp - 135,
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Center(
                child: Container(
                  height: global.ap * 0.4,
                  width: global.ap * 0.4,
                  child: contactoVector(),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(40, 0, 10, 0),
                      child: Text(
                        "Añadir contacto",
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: "Cera Bold",
                            color: Colors.black12),
                      )),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black12,
                  )
                ],
              ),
            )
          ],
        )),
      );
    }
  }
}
