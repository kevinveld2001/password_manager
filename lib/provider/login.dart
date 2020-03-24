import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';


class LoginState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _mainscreen;
  String _userID;
  bool _seePassword = true;
  bool _waiterBootScreen = false;
  bool _loginErr = false;

  bool get loginErr => _loginErr;
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

  Future startByTimeOut(int sec) {
   Future.delayed(Duration(seconds: sec), () {
    _waiterBootScreen = true;
    _loginErr = false;
    notifyListeners();
    
   });
   return null;
  }
  Future resterErr(int sec) {
   Future.delayed(Duration(seconds: sec), () {
    _loginErr = false;
    notifyListeners();
    
   });
   return null;
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
        _loginErr = true;
        notifyListeners();
        resterErr(3);
      });
      
   
  }
  void registerByEmail(String email, String password) {
    _auth.createUserWithEmailAndPassword(email: email, password: password)
    .then((v){
      try{
        v.user.sendEmailVerification();
        print("email send");
      }catch(err){
        print (err);
      }
      _userID = v.user.uid;
      _mainscreen = "mainScreen";
      print(_userID);
      
      notifyListeners();
    }).catchError((err){
      print(err);
      _loginErr = true;
      notifyListeners();
      resterErr(3);
    });
    
  }

  void logout(){
    _auth.signOut();
    _mainscreen = "loginScreen";
      _userID = null;
    
    notifyListeners();
    
  }

  Future<bool> resterEmail(String email)async{
    print("reset "+email);
    bool sucsess = true;
    print(email);
    try{
    await _auth.sendPasswordResetEmail(email: email)
    .catchError((e){
      
        print("e="+e);
        sucsess = false;
      
    }).then((e){
      
    });
    }catch(err){
      sucsess = false;
    }
    
    
    return sucsess;
  }
  



}