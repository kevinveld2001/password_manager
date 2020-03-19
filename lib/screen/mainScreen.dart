import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';
import '../widgets/addPasswordBottemSheet.dart';
import '../widgets/passwordCardWidget.dart';
import '../provider/firebase.dart';

String _seartch = "";

class MainScreen extends StatelessWidget {
  final _seartchFormKey = GlobalKey<FormState>();


  
  @override
  Widget build(BuildContext context) {
  

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Future _showBottomSheet() async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular( 16.0)
          ) 
          
        ),
        builder: (widgetBuilder) => BottomSheetBuilder()
    );
  }


    var firebaseState = Provider.of<FirebaseState>(context);
    var loginState = Provider.of<LoginState>(context);
    
    firebaseState.getpasswords(loginState.userID);

    
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
                      
                      onChanged: (v){
                        _seartch = v;
                        firebaseState.seartch(v);
                      },
                      initialValue: _seartch,
                      
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
                  ])),

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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: firebaseState.passwordList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return PasswordCardWidget(
                firebaseState.passwordList[index].title,
                firebaseState.passwordList[index].email,
                firebaseState.passwordList[index].docID
                );
            }
            
            ),
         
        )
        ],),
        
      ),
      ),

    floatingActionButton: FloatingActionButton(
      backgroundColor:  Color(0xFF00BFA5),
      child: Icon(Icons.add),
      onPressed: ()async{
        _showBottomSheet();
      },

    ),
    );
  }
}


