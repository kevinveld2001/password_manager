import 'package:flutter/material.dart';

import '../widgets/pinInput.dart';

class PinCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors: [Color(0xFF00BFA5),Color(0xFF1DE9B6)],
            
          )
        ),
        child: Column(children: <Widget>[
          Expanded(
            flex: 8,
            child: Container(
              child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50 , horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "make a new pin code",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    PinInput(0),
                    PinInput(0),
                    PinInput(1),
                    PinInput(2),
                    PinInput(2),
                    PinInput(2),

                  ],)


              ])),

            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular( 16.0)
                  ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50 , horizontal: 40),

                child: Container(
                  
                  child: Column(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("1"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("2"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("3"),
                          ),
                          ),
                        ),
                        
                      ],)
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("4"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("5"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("6"),
                          ),
                          ),
                        ),
                        
                      ],)
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("7"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("8"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("9"),
                          ),
                          ),
                        ),
                        
                      ],)
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: Icon(Icons.check,size: 35,)
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child: RondBTN(
                            onPressed: (){},
                            child: RondBTNText("0"),
                          ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                          child:RondBTN(
                            onPressed: (){},
                            child: Icon(Icons.backspace,size: 35,)
                          ),
                          ),
                        ),
                       
                      ],)
                    ),
                  ],)
                    
                ),
              ),
            ),
          ),
        ],)

      ),
    );
  }
}


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