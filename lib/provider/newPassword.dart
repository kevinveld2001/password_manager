import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class NewPasswordState with ChangeNotifier {

  List<String> _inputfields = ["","","",""];
  bool _passwordVissible = true;

  

  List<String> get inputfields  => _inputfields;
  bool get passwordVissible => _passwordVissible;



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

  int finish (String uid){
    
    for (int i = 0; i < _inputfields.length - 1; i++){
      if(_inputfields[i].isEmpty){
        return i;
      }
    }

  print("add new password \nTitle: ${_inputfields[0]}\nEmail:${_inputfields[1]}\nPassword:${_inputfields[2]}\nNOTE:${_inputfields[3]}");

  Firestore.instance.collection('store/$uid/passwords').document()
    .setData({ 
      'title': _inputfields[0],
      'email': _inputfields[1],
      'password': _inputfields[2],
      'note': _inputfields[3],
       });


  clearInput();
  notifyListeners();
  //sucses code :)
  return 255;
  }


}