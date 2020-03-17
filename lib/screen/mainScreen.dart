import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';

String _seartch;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final _seartchFormKey = GlobalKey<FormState>();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var loginState = Provider.of<LoginState>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body:SingleChildScrollView(
        child:Container(
          width: width,
          height: height,
        
        child: Column(children: <Widget>[
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

            child:Stack(children: <Widget>[
Padding(
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
                  key: _seartchFormKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (v){
                        _seartch = v;
                      },
                      
                      initialValue:_seartch,
                      decoration: InputDecoration(
                        
                        hintText: "Find your password",
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
                  ]))

              ],),
            ),
            Positioned(
                top:30,
                right: 10,
              child: IconButton(
                icon: Icon(Icons.exit_to_app,
                color: Colors.white,
                ),
                onPressed: (){
                  loginState.logout();
                },
              )
            ),
            
            ],) ,
            
            
            
            constraints: BoxConstraints.expand(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(child: Text("de rest"))
        )
        ],),
        
      ),
      )
    );
  }
}