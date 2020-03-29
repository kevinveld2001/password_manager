import 'package:flutter/material.dart';



class RondBTN extends StatelessWidget {
  
  RondBTN({Key key, @required this.onPressed, @required this.child});
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(child: RawMaterialButton(
        onPressed: onPressed,
        child: child,
        elevation: 0.0,
        shape: CircleBorder(),
        fillColor: Colors.white,
      ),);
                          
  }
}

class RondBTNText extends StatelessWidget {

  RondBTNText(this._text);
  final String _text;
  @override
  Widget build(BuildContext context) {
    return Text(_text,
    style: TextStyle(
      fontSize: 35,
    ),
    );
  }
}