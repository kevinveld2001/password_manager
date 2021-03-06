import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:encrypt/encrypt.dart' as encrypt;


class LoginState with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _mainscreen;
  String _userID;
  String _userEmail;
  bool _seePassword = true;
  bool _waiterBootScreen = false;
  bool _loginErr = false;
  String _pincode = "";
  List<int> _pincodearray = [1,2,2,2,2,2];
  bool _correctpin = false;
  bool _emailVerificatie = false;

  bool get emailVerificatie => _emailVerificatie;
  bool get correctpin => _correctpin;
  List<int> get pincodearray => _pincodearray;
  String get pincode => _pincode;
  bool get loginErr => _loginErr;
  bool get waiterBootScreen => _waiterBootScreen;
  bool get seePassword  => _seePassword;
  String get mainsreen => _mainscreen; 
  String get userID => _userID;
  String get userEmail => _userEmail;



  LoginState(){
    _auth.currentUser().then((value){
      
      if(value == null){
        _mainscreen = "loginScreen";
        _userID = null;
        _userEmail = null;
        _emailVerificatie = false;
        notifyListeners();
      }else{
        _mainscreen = "mainScreen";
        _userID = value.uid;
        _userEmail = value.email;
        _emailVerificatie = value.isEmailVerified;
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
        _userEmail = v.user.email;
        _mainscreen = "mainScreen";
        _emailVerificatie = v.user.isEmailVerified;
        print(_userID);
        notifyListeners();
      }).catchError((err){
        print (err);
        _loginErr = true;
        _emailVerificatie = false;
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
      _userEmail = v.user.email;
      _mainscreen = "mainScreen";
      _emailVerificatie = v.user.isEmailVerified;
      print(_userID);
      
      notifyListeners();
    }).catchError((err){
      print(err);
      _loginErr = true;
      _emailVerificatie = false;
      notifyListeners();
      resterErr(3);
    });
    
  }

  void logout(){
    _auth.signOut();
    _mainscreen = "loginScreen";
      _userID = null;
      _userEmail = null;
      _emailVerificatie = false;
    clearPin();
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
  



  //pin code

  void addPinNum (String number){
    if(_pincode.length < 6){
    print(number);
    _pincode += number;
    print(_pincode);
    for(int i=0; i < _pincodearray.length ; i++){
      if (_pincodearray[i] == 1){
        _pincodearray[i] = 0;
        if(i < 5){
          _pincodearray[i + 1] = 1;
        }
        break;
      }
    }

    notifyListeners();
    }
  }

  void removeOnePin (){
    try{
    _pincode = _pincode.substring(0,_pincode.length-1);
    print(_pincode);
    bool removedone = false;
      for(int i=0; i < _pincodearray.length ; i++){
        if (_pincodearray[i] == 1 && i != 0){
          _pincodearray[i] = 2;
          if(i <= 5){
            _pincodearray[i - 1] = 1;
          }
          removedone = true;
          break;
        }
      }
      if(!removedone){
        _pincodearray = [0,0,0,0,0,1];
      }
    }catch(err){
      print(err);
    }
    notifyListeners();
  }


  void clearPin (){
    _pincode = "";
    _pincodearray = [1,2,2,2,2,2];
    _correctpin = false;
    notifyListeners();
  }

  String encriptByPin(){
    final plainText = 'success';
    final key = encrypt.Key.fromUtf8(_pincode + '..........................');
    final iv = encrypt.IV.fromLength(6);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    

    
    print(encrypted.base64);
    return encrypted.base64.toString();
  }


  void decryptByPin(String tester){
    print("to decrypt: "+ tester);
    try{
    encrypt.Encrypted encryptedTester = encrypt.Encrypted.from64(tester);

    final key = encrypt.Key.fromUtf8(_pincode + '..........................');
    final iv = encrypt.IV.fromLength(6);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt(encryptedTester, iv: iv);
    print(decrypted); 



    if(decrypted == "success"){
      print("ja het werkt je mag door");
       _correctpin = true;
       notifyListeners();
    }
    }catch(err){
        
        clearPin();
      
    }


  }


}