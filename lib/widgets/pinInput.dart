import 'package:flutter/material.dart';


class PinInput extends StatelessWidget {

  final int _status;
  PinInput(this._status);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _status == 1?36:40,
      height: _status == 1?36:40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.all(Radius.circular( 16.0)),
      ),
      child:Center(
        child: _status == 0 ? Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadiusDirectional.all(Radius.circular( 5.0)),
          ),

        ) :SizedBox()
      ),
    );
  }
}