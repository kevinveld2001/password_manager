import 'package:flutter/material.dart';

class PasswordCardWidget extends StatelessWidget {
PasswordCardWidget(this._title,this._email,this._docid);

String _email;
String _title;
String _docid;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(40, 50, 0, 130),
      child: Container(
        height: 100,
        width: 200,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          ListTile(
          title: Text(_title),
          subtitle: Text(_email),
        ),
        Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
            
            onPressed: (){},
            child:Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
            child: Text("see more",
              style: TextStyle(
                color: Color(0xFF00BFA5),
              )
            ) ,
            ),
          ),
        ],)

        ],) 
      ),
    );
  }
}