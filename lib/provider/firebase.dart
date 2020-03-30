import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import 'passwords.dart';
class FirebaseState with ChangeNotifier {
  FirebaseState();

  List<PasswordHolder> _passwordList= [];
  String _pintest;
  bool _seartch = false;
  List<PasswordHolder> _seartchpasswordList= [];
  bool _viewpasswordVisebility = false;

  bool get viewpasswordVisebility => _viewpasswordVisebility;

  String get pintest => _pintest;

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

  void deleteitem(String docID,String uid){
    Firestore.instance.collection("store/$uid/passwords").document(docID).delete();
    notifyListeners();
  }

  void getPinTest(String uid)async{
    print("get key fom uid: "+uid);
    try{
      if(uid !=""){
      DocumentSnapshot ds = await Firestore.instance.collection("pin").document(uid).get();

      _pintest = ds.data["pintest"].toString();
      }
    }catch(err){
      var keeperr = err;
      _pintest = null;
    }
    notifyListeners();

  }

  void setPinTest(String uid,String pintest){
    Firestore.instance.collection("pin").document(uid).setData({'pintest': pintest,});
  }



  
void setViewPasswordStrate(bool viewPasswordState){
  _viewpasswordVisebility = viewPasswordState;
  notifyListeners();
}




}


