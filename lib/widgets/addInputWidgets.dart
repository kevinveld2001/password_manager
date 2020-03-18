import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';
import '../provider/newPassword.dart';

class TitleInput extends StatelessWidget {
  final void Function(int) onAddButtonTapped;
  final int mePage;
  TitleInput(this.onAddButtonTapped, this.mePage);

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
                  onAddButtonTapped(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  
              },
            )
         ],)
    );
  }
}

class EmailInput extends StatelessWidget {
  final void Function(int) onAddButtonTapped;
  final int mePage;
  EmailInput(this.onAddButtonTapped, this.mePage);

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
                onAddButtonTapped(mePage-1);
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
                  onAddButtonTapped(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  
              },
            )
            ],),
            
         ],)
    );
  }
}

class PasswordInput extends StatelessWidget {
  final void Function(int) onAddButtonTapped;
  final int mePage;
  PasswordInput(this.onAddButtonTapped, this.mePage);

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
                onAddButtonTapped(mePage-1);
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
                  onAddButtonTapped(mePage+1);
                  FocusScope.of(context).requestFocus(new FocusNode()); //remove focus
                  
              },
            )
            ],),
            
         ],)
    );
  }
}


class NoteInput extends StatelessWidget {
  final void Function(int) onAddButtonTapped;
  final int mePage;
  NoteInput(this.onAddButtonTapped, this.mePage);

  @override
  Widget build(BuildContext context) {
    var newPasswordState = Provider.of<NewPasswordState>(context);
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
                onAddButtonTapped(mePage-1);
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
                  newPasswordState.clearInput();
                  Navigator.pop(context);
              },
            )
            ],),
            
         ],)
    );
  }
}

