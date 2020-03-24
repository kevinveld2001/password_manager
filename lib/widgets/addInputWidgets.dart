import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';
import '../provider/newPassword.dart';

class TitleInput extends StatelessWidget {
  final void Function(int) goPage;
  final int mePage;
  TitleInput(this.goPage, this.mePage);

  @override
  Widget build(BuildContext context) {
    var newPasswordState = Provider.of<NewPasswordState>(context);
  TextEditingController textFieldController = TextEditingController()..text = newPasswordState.inputfields[0];
    return Padding(
         padding: EdgeInsets.all(40),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
           TextField(

             controller:textFieldController,
             onChanged: (v){
               newPasswordState.setInputField(0, v);
             },
            decoration: InputDecoration( 
              
              hintText: "Title",
              
             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width:2,
                )
              )
            ),
           
           ),

            SizedBox(height: 40,),

            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("next",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  goPage(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  
              },
            )
         ],)
    );
  }
}

class EmailInput extends StatelessWidget {
  final void Function(int) goPage;
  final int mePage;
  EmailInput(this.goPage, this.mePage);

  @override
  Widget build(BuildContext context) {
    var newPasswordState = Provider.of<NewPasswordState>(context);
  TextEditingController textFieldController = TextEditingController()..text = newPasswordState.inputfields[1];
    return Padding(
         padding: EdgeInsets.all(40),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
           TextField(
             keyboardType: TextInputType.emailAddress,
             controller:textFieldController,
             onChanged: (v){
               newPasswordState.setInputField(1, v);
             },
            decoration: InputDecoration( 
              
              hintText: "User name / email",
              
             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width:2,
                )
              )
            ),
           
           ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
              onPressed: (){
                goPage(mePage-1);
                  FocusScope.of(context).requestFocus(new FocusNode());
              },
               child: Text("back",
               style: TextStyle(
                  color: Color(0xFF00BFA5),
                ),
               )
               ),
            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("next",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  goPage(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  
              },
            )
            ],),
            
         ],)
    );
  }
}

class PasswordInput extends StatelessWidget {
  final void Function(int) goPage;
  final int mePage;
  PasswordInput(this.goPage, this.mePage);

  @override
  Widget build(BuildContext context) {
    var newPasswordState = Provider.of<NewPasswordState>(context);
  TextEditingController textFieldController = TextEditingController()..text = newPasswordState.inputfields[2];
    return Padding(
         padding: EdgeInsets.all(40),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
           TextField(
             
             controller:textFieldController,
             onChanged: (v){
               newPasswordState.setInputField(2, v);
             },

            obscureText: newPasswordState.passwordVissible,

            decoration: InputDecoration( 
              suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),
                focusColor: Colors.black
                , onPressed: (){
                     newPasswordState.seePasswordSwitch();
              }),

              
              hintText: "Password",
              
             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width:2,
                )
              )
            ),
           
           ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                
                FlatButton(
              onPressed: (){
                if(newPasswordState.passwordVissible == false){
                    newPasswordState.seePasswordSwitch();
                  }
                goPage(mePage-1);
                  FocusScope.of(context).requestFocus(new FocusNode());
              },
               child: Text("back",
               style: TextStyle(
                  color: Color(0xFF00BFA5),
                ),
               )
               ),
            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("next",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  goPage(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  if(newPasswordState.passwordVissible == false){
                    newPasswordState.seePasswordSwitch();
                  }
              },
            )
            ],),
            FlatButton(
              onPressed: (){
                newPasswordState.setRandomPassword(20);
              },
               child: Text("random password",
               style: TextStyle(
                  color: Color(0xFF00BFA5),
                ),
               )
               ),
         ],)
    );
  }
}


class NoteInput extends StatelessWidget {
  final void Function(int) goPage;
  final int mePage;
  NoteInput(this.goPage, this.mePage);

  @override
  Widget build(BuildContext context) {
    var newPasswordState = Provider.of<NewPasswordState>(context);
    var loginState = Provider.of<LoginState>(context);
  TextEditingController textFieldController = TextEditingController()..text = newPasswordState.inputfields[3];
    return Padding(
         padding: EdgeInsets.all(40),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
           TextField(
             
             controller:textFieldController,
             onChanged: (v){
               newPasswordState.setInputField(3, v);
             },
             keyboardType: TextInputType.multiline,
              maxLines: 3,

            

            decoration: InputDecoration( 
              
              hintText: "Extra note",
              
             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width:2,
                )
              )
            ),
           
           ),

            SizedBox(height: 40,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
              onPressed: (){
                goPage(mePage-1);
                  FocusScope.of(context).requestFocus(new FocusNode());
              },
               child: Text("back",
               style: TextStyle(
                  color: Color(0xFF00BFA5),
                ),
               )
               ),
            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("Finish",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){
                  
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  int statuscode = newPasswordState.finish(loginState.userID);
                  if(statuscode == 255){
                    Navigator.pop(context);
                  }else{
                    goPage(statuscode);
                  }
                  
                  
                  
              },
            )
            ],),
            
         ],)
    );
  }
}

