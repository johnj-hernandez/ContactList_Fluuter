import 'package:colorcontact/Resources/global.dart' as global;
import 'package:flutter/widgets.dart';


class masVector extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var assetImage = new AssetImage('assets/masVector.png');
    var image = new Image(image: assetImage, height: global.lp,);
    return Container(child: image ,);
  }

}

class contactoVector extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var assetImage = new AssetImage('assets/contactoVector.png');
    var image = new Image(image: assetImage, height: global.lp,);
    return Container(child: image ,);
  }

}