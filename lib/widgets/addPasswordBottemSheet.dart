import 'package:flutter/material.dart';



import 'addInputWidgets.dart';

class BottomSheetBuilder extends StatelessWidget {
  
  final PageController controller = PageController();

  void goScreen(int index) {

    // use this to animate to the page
    controller.animateToPage(index,duration: Duration(milliseconds: 600),curve: Curves.ease);

    
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height - 170,
      alignment: Alignment.topLeft,

       child: PageView(
         
         controller: controller,
           children: <Widget>[
             TitleInput(goScreen,0),
             EmailInput(goScreen,1),
             PasswordInput(goScreen,2),
             NoteInput(goScreen,3),

           ],
         )
       
       
      
    );
  }
}


