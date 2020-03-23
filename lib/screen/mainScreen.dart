import 'package:flutter/material.dart';
import 'package:password_manager/provider/newPassword.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';
import '../widgets/addPasswordBottemSheet.dart';
import '../widgets/passwordCardWidget.dart';
import '../provider/firebase.dart';
import '../widgets/viewPasswordBottemSheet.dart';


String _seartch = "";

Future<void> startFirebaseState(var firebaseState,var loginState) {
  // Imagine that this function is fetching user info from another service or database
  return Future.delayed(Duration(seconds: 1), () => firebaseState.getpasswords(loginState.userID));
}




class MainScreen extends StatelessWidget {
  final _seartchFormKey = GlobalKey<FormState>();


  
  @override
  Widget build(BuildContext context) {
  

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Future _showNewPasswordBottomSheet() async {
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
      Future _showPasswordViewBottomSheet(String docID) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular( 16.0)
          ) 
          
        ),
        builder: (widgetBuilder) => ViewPasswordBottomSheetBuilder(docID)
    );}


    var firebaseState = Provider.of<FirebaseState>(context);
    var newPasswordState = Provider.of<NewPasswordState>(context);
    var loginState = Provider.of<LoginState>(context);
    if (firebaseState.passwordList.length ==0){ 
         startFirebaseState(firebaseState,loginState);
    }
    
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
                  firebaseState.clear(); //clear all data 
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
                firebaseState.passwordList[index].docID,
                _showPasswordViewBottomSheet
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
        _showNewPasswordBottomSheet();
        newPasswordState.clearInput();
        FocusScope.of(context).requestFocus(new FocusNode());
      },

    ),
    );
  }
}


