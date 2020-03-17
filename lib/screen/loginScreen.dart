import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';



String _email = "";
String _password = "";


class LoginScreen extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var loginState = Provider.of<LoginState>(context);
    return Scaffold(
      
      resizeToAvoidBottomPadding: true,
      body:SingleChildScrollView(
        child:Container(
          width: width,
          height: height,
        child:Column(
          
          children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              
              image: DecorationImage(
                image: AssetImage("packages/password_manager/assets/background.png"),
                fit: BoxFit.fill
              )
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50 , horizontal: 40),
              child: Column(
                
                children: <Widget>[
                Text(
                  "keep your password save",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  ),

                SizedBox(height: 30,),
                  
                Form(
                  key: _loginFormKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (v){
                        _email = v;
                      },
                      validator: (v){
                        if(v.isEmpty){
                          return 'please enter your email';
                        }
                       
                        return null;
                      },
                      initialValue:_email,
                      decoration: InputDecoration(
                        
                        hintText: "Email",
                        filled: true,
                        fillColor: Colors.white,
                        
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
                    SizedBox(height: 15,),
                    TextFormField(
                      onChanged: (v){
                        _password = v;
                      },
                      validator: (v){
                        if(v.isEmpty){
                          return 'please enter your password';
                        }
                        if(v.length <6){
                          return 'password to sort';
                        }
                        return null;
                      },
                      initialValue:_password,
                      obscureText: loginState.seePassword,
                      decoration: InputDecoration(
                        
                        hintText: "password",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),
                        focusColor: Colors.black
                        , onPressed: (){
                            loginState.seePasswordSwitch();
                        }),
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
                    
                  ],),
                )

              ],),
            ),
            constraints: BoxConstraints.expand(),
          ),
        ),
        Expanded(
          flex: 1,
          child:Padding(
            padding:EdgeInsets.symmetric(horizontal: 40),
            child: Container(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
              FlatButton(
                
                onPressed: (){

              }, child: Text("REGISTER",
              style: TextStyle(
                color: Color(0xFF00BFA5),
              ),
              )),
              RaisedButton(
                color: Color(0xFF00BFA5),
                onPressed: (){

                  if(_loginFormKey.currentState.validate()){
                    loginState.loginByEmail(_email, _password);
                    _email = "";
                    _password = "";
                  }

                },
                child: Row(children: <Widget>[
                  Icon(Icons.lock_open,
                  color: Colors.white,
                  ),
                  Text("LOGIN",
                  style: TextStyle(
                    color: Colors.white
                  ),)
                ],),
              ),
              
            ],),
          ),
            
            ), 
        ), 
      ],),
        )
      ),
      
       
    );
  }
}