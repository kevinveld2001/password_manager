import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/login.dart';

class BottomSheetBuilder extends StatelessWidget {
  // double _width;
  // double _height;

  // BottomSheetBuilder(this._height,this._width);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height - 170,
      alignment: Alignment.topLeft,

       child:Padding(
         padding: EdgeInsets.all(40),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
           TextField(


             
            decoration: InputDecoration(

              hintText: "Title",

             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width:2,
                )
              )
            ),
           
           ),

            SizedBox(height: 40,),

            RaisedButton(
              color: Color(0xFF00BFA5),
               child: Text("next",
                  style: TextStyle(
                    color: Colors.white
                  ),),
              onPressed: (){

              },
            )
         ],),
       )
      
    );
  }
}


