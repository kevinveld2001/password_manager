import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class TosView extends StatelessWidget {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('packages/password_manager/assets/terms-of-service.txt');
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height - 170,
      child: ListView(
        padding: EdgeInsets.all(40),
        children: <Widget>[
          
          FutureBuilder<String>(
            future: loadAsset(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot){
              if(snapshot.hasData){
                return Text(snapshot.data);
              }else {
                return CircularProgressIndicator();
              }
            }

          ),
          RaisedButton(
            color: Color(0xFF00BFA5),
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("agree",style: TextStyle(color: Colors.white),),
          )

        ],
      ),
    );
  }
}