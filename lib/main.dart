// package's
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//porvider's
import 'provider/login.dart';
import 'provider/firebase.dart';
import 'provider/newPassword.dart';

//screen's
import 'screen/loginScreen.dart';
import 'screen/mainScreen.dart';

void main() => runApp(ProviderHome());

class ProviderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(create: (_) => LoginState()),
        ChangeNotifierProvider<FirebaseState>(create: (_) => FirebaseState()),
        ChangeNotifierProvider<NewPasswordState>(create: (_) => NewPasswordState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:ScreenBuilder(),
      ),
    );
  }
}






class ScreenBuilder extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var loginState = Provider.of<LoginState>(context);
    

    loginState.startApp();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    if(loginState.mainsreen == "loginScreen" && loginState.waiterBootScreen){
      return LoginScreen();

    } else if (loginState.mainsreen == "mainScreen" && loginState.waiterBootScreen) {
      return MainScreen();

    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset("packages/password_manager/assets/icon.png"),
          )
        ),
      );
    }

    
  }
}


