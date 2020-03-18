import 'package:flutter/foundation.dart';




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
    _inputfields = ["","","",""];
    notifyListeners();
  }

}