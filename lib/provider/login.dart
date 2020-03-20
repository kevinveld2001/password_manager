import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';


class LoginState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _mainscreen;
  String _userID;
  bool _seePassword = true;
  bool _waiterBootScreen = false;



  bool get waiterBootScreen => _waiterBootScreen;
  bool get seePassword  => _seePassword;
  String get mainsreen => _mainscreen; 
  String get userID => _userID;



  LoginState(){
    _auth.currentUser().then((value){
      
      if(value == null){
        _mainscreen = "loginScreen";
        _userID = null;
        notifyListeners();
      }else{
        _mainscreen = "mainScreen";
        _userID = value.uid;
        notifyListeners();
      }
      

    });
  }

  void startApp(){
    startByTimeOut(5);
  }

  Future<void> startByTimeOut(int sec) {
   Future.delayed(Duration(seconds: sec), () {
    _waiterBootScreen = true;
    notifyListeners();
   });
  }



  void seePasswordSwitch(){
    _seePassword = !_seePassword;
    notifyListeners();
  }

 void loginByEmail(String email, String password){
    _auth.signInWithEmailAndPassword(
      email: email,
      password: password
      ).then((v){
        _userID = v.user.uid;
        _mainscreen = "mainScreen";
        print(_userID);
        notifyListeners();
      }).catchError((err){
        print (err);
      });
      
   
  }

  void logout(){
    _auth.signOut();
    _mainscreen = "loginScreen";
      _userID = null;
    notifyListeners();
  }


}