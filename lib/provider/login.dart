import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';


class LoginState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _mainscreen;
  String _userID;
  String get mainsreen => _mainscreen; 

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

}