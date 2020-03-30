import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;

class NewPasswordState with ChangeNotifier {

  List<String> _inputfields = ["","","",""];
  bool _passwordVissible = true;

  List<String> get inputfields  => _inputfields;
  bool get passwordVissible => _passwordVissible;


  // password settings var's
  bool _allowUpperCaseLetters = true;
  bool _allowNumbers = true;
  bool _allowSpecial = false;

  bool get allowUpperCaseLetters => _allowUpperCaseLetters;
  bool get allowNumbers => _allowNumbers;
  bool get allowSpecial => _allowSpecial;

  void setAllowUpperCaseLetters(bool value){
    _allowUpperCaseLetters = value;
    notifyListeners();
  }
  void setAllowNumbers(bool value){
    _allowNumbers = value;
    notifyListeners();
  }
  void setAllowSpecial(bool value){
    _allowSpecial = value;
    notifyListeners();
  }





  void setInputField(int index , String value){
    _inputfields[index] = value;
  }
  void seePasswordSwitch (){
    _passwordVissible = !_passwordVissible;
    notifyListeners();
  }

  void clearInput(){
    for (int i = 0; i < _inputfields.length ; i++){
      _inputfields[i] = "";
    }
    notifyListeners();
  }

  int finish (String uid,{String pincode}){
    
    for (int i = 0; i < _inputfields.length - 1; i++){
      if(_inputfields[i].isEmpty){
        return i;
      }
    }

  print("add new password \nTitle: ${_inputfields[0]}\nEmail:${_inputfields[1]}\nPassword:${_inputfields[2]}\nNOTE:${_inputfields[3]}");

String _newPassword;

if(pincode == null){
  _newPassword = _inputfields[2];
}else{
    final plainText = _inputfields[2];
    final key = encrypt.Key.fromUtf8(pincode + '..........................');
    final iv = encrypt.IV.fromLength(6);

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    

    print("encrypted password: "+encrypted.base64);
    _newPassword = encrypted.base64;
}

print("password: "+_newPassword);


  Firestore.instance.collection('store/$uid/passwords').document()
    .setData({ 
      'title': _inputfields[0],
      'email': _inputfields[1],
      'password': _newPassword,
      'note': _inputfields[3],
       });


  clearInput();
  notifyListeners();
  //sucses code :)
  return 255;
  }

  String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String _numbers = "0123456789";
  String _special = "@#=+!£\$%&?[](){}";

  /// make a random password and put it in the password fieled;
  /// [length] set length of password
  /// [nummbers] put numbers in the password
  void setRandomPassword(int length){
    String _charList = ""; 
    _charList += _lowerCaseLetters;
    _charList += (_allowUpperCaseLetters?_upperCaseLetters:"");
    _charList += (_allowNumbers?_numbers:"");
    _charList += (_allowSpecial?_special:"");

    String newRandomPassword = "";
    for(int i=0;i<length;i++){
      int randomInt = Random.secure().nextInt(_charList.length);
      newRandomPassword += _charList[randomInt];
    }
    _inputfields[2] = newRandomPassword;
    notifyListeners();
  }


}