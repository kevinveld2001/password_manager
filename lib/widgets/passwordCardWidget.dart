import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/firebase.dart';


class PasswordCardWidget extends StatelessWidget {
PasswordCardWidget(this._title,this._email,this._docid,this._viewPasswordBottomSheet);

final _email;
final _title;
final _docid;
final Future Function(String) _viewPasswordBottomSheet;
// Future viewPasswordBottomSheet;
  @override
  Widget build(BuildContext context) {
    var firebaseState = Provider.of<FirebaseState>(context);
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
            
            onPressed: (){
              firebaseState.setViewPasswordStrate(false);
              _viewPasswordBottomSheet(_docid);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
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