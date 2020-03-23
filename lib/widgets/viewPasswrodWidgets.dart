import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewPasswordInputBox extends StatelessWidget {
  String _type;
  String _data;

  ViewPasswordInputBox(this._type,this._data);
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController()..text = _data;
    return TextField(
            obscureText: _type == "password"? true: false,
            controller: _textFieldController,
            readOnly: true,
            maxLines: _type == "note"? 3: 1,
            decoration: InputDecoration( 
              
              
              suffixIcon: IconButton(icon: Icon(Icons.content_copy),
                focusColor: Colors.black
                , onPressed: (){
                     // copy data to clipboard
                     Clipboard.setData(ClipboardData(text: _data));
                     
               }),
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
           
           );
  }
}