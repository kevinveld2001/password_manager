import 'package:flutter/material.dart';

import 'loginScreen.dart';
import 'registerScreen.dart';


class LoginRegisterSwitcher extends StatelessWidget {
  PageController controller = PageController();
     void goScreen(int index) {
      controller.animateToPage(index,duration: Duration(milliseconds: 300),curve: Curves.ease);
    }
  @override
  Widget build(BuildContext context) {
    return PageView(
         
         controller: controller,
           children: <Widget>[
             LoginScreen(goScreen,0),
             RegisterScreen(goScreen,1),
           ],
         );
  }
}