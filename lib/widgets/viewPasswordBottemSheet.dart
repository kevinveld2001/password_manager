import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/firebase.dart';
import '../provider/passwords.dart';
import 'viewPasswrodWidgets.dart';

class ViewPasswordBottomSheetBuilder extends StatelessWidget {
  String _docID;
  
  ViewPasswordBottomSheetBuilder(this._docID);

  String _title;
  String _email;
  String _password;
  String _note;
  @override
  Widget build(BuildContext context) {
    var firebaseState = Provider.of<FirebaseState>(context);
    double height = MediaQuery.of(context).size.height;
    
    List<PasswordHolder> passwordList = firebaseState.passwordList;

    for(int i = 0 ; i < passwordList.length; i++){
        if(passwordList[i].docID == _docID){
          _title =passwordList[i].title;
          _email = passwordList[i].email;
          _password = passwordList[i].password;
          _note = passwordList[i].note;
        }
    }


    return Container(
      height: height - 170,
      alignment: Alignment.topLeft,

       child: ListView(
         padding: EdgeInsets.all(40),
         
           children: <Widget>[
             
             ViewPasswordInputBox("title",_title),
             SizedBox(height: 20,),
             ViewPasswordInputBox("email",_email),
             SizedBox(height: 20,),
             ViewPasswordInputBox("password",_password),
             SizedBox(height: 20,),
             ViewPasswordInputBox("note",_note),

           ],
         )
    );
  }
}


