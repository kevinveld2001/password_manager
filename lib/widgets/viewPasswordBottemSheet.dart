import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../provider/firebase.dart';
import '../provider/passwords.dart';
import 'viewPasswrodWidgets.dart';
import '../provider/login.dart';

import 'package:encrypt/encrypt.dart' as encrypt;

class ViewPasswordBottomSheetBuilder extends StatelessWidget {
  final String _docID;
  
  ViewPasswordBottomSheetBuilder(this._docID);

  String _title;
  String _email;
  String _password;
  String _note;
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    var firebaseState = Provider.of<FirebaseState>(context);
    var loginState = Provider.of<LoginState>(context);
    

    List<PasswordHolder> passwordList = firebaseState.passwordList;

    Future _showDeleteBox () {
      showDialog(
        context: context,
        builder: (BuildContext context){
            return AlertDialog(
              title: Text("Delete?"),
              content: Text("Are you sure you want to delete this item?"),
              actions: <Widget>[
                FlatButton(
              onPressed: (){
                print("delete doc: "+_docID);

                firebaseState.deleteitem(_docID,loginState.userID);
                Navigator.pop(context);
                Navigator.pop(context);
                
              },
               child: Text("delete",
               style: TextStyle(
                  color: Colors.red
                ),
               )
               ),
            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("CANCEL",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  
                  Navigator.pop(context);
                  
              },
            )
              ],
                
                  
                
              
            );
        }
      );
    }




    for(int i = 0 ; i < passwordList.length; i++){
        if(passwordList[i].docID == _docID){
          _title =passwordList[i].title;
          _email = passwordList[i].email;


              String _decryptedPassword = passwordList[i].password;
              encrypt.Encrypted encryptedTester = encrypt.Encrypted.from64(_decryptedPassword);
              try{
              final key = encrypt.Key.fromUtf8(loginState.pincode + '..........................');
              final iv = encrypt.IV.fromLength(6);
              final encrypter = encrypt.Encrypter(encrypt.AES(key));
              final decrypted = encrypter.decrypt(encryptedTester, iv: iv);
              print("decrypted password: "+decrypted); 

              _decryptedPassword = decrypted;

              }catch(err){
                print(err);
              }




          _password = _decryptedPassword;
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
             ViewPasswordInputBox(firebaseState.viewpasswordVisebility?"seepass":"password",_password),
             SizedBox(height: 1,),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
               FlatButton(
              onPressed: (){
                
                if(firebaseState.viewpasswordVisebility){
                  firebaseState.setViewPasswordStrate(false);
                }else{
                  firebaseState.setViewPasswordStrate(true);
                }


              },
               child: Text("see password",
               style: TextStyle(
                  color: Color(0xFF00BFA5),
                ),
               )
               ),

               ],),
             SizedBox(height: 1,),
             ViewPasswordInputBox("note",_note),
              SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              
                FlatButton(
              onPressed: (){
                _showDeleteBox();
              },
               child: Text("delete",
               style: TextStyle(
                  color: Colors.grey
                ),
               )
               ),
            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("DONE",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  
                  Navigator.pop(context);
                  
              },
            )
            ],),
           ],
         )
    );
  }
}


