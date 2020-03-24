import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'passwords.dart';
class FirebaseState with ChangeNotifier {

  List<PasswordHolder> _passwordList= [];
  List<PasswordHolder> _seartchpasswordList= [];

  bool _seartch = false;
 
  
  List<PasswordHolder> get passwordList => _seartch?_seartchpasswordList : _passwordList;

  void seartch (String term) {
    if(term.isEmpty){
      _seartch = false;
    }else{
      _seartchpasswordList.clear();
      for(int i = 0; i< _passwordList.length;i++){
        if(_passwordList[i].title.contains(term)){
          _seartchpasswordList.add(_passwordList[i]);
        }
      }
      _seartch = true;
    }
  }

  

  FirebaseState();




  void getpasswords(String uid){
     Firestore.instance
    .collection("store/$uid/passwords")
    // .where("title", isGreaterThanOrEqualTo: search,)
    .snapshots()
    .listen((data){
      _passwordList.clear();
      data.documents.forEach((doc) {
           
          
          _passwordList.add(new PasswordHolder(
            doc["title"].toString(),
            doc["email"].toString(),
            doc["password"].toString(),
            doc["note"].toString(),
            doc.documentID.toString()
          ));
        });
        notifyListeners();
    });

  }


  void clear(){
    _passwordList.clear();
    _seartchpasswordList.clear();
    _seartch = false;
  }

}
