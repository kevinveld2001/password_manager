// package's
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//porvider's
import 'provider/login.dart';
import 'provider/firebase.dart';

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
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    if(loginState.mainsreen == "loginScreen"){
      return LoginScreen();

    } else if (loginState.mainsreen == "mainScreen") {
      return MainScreen();

    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    
  }
}