import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igcestaff/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:igcestaff/screens/login.dart';
import 'package:igcestaff/screens/signup.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

   runApp(MyApp());

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    routes: <String,WidgetBuilder>{

      "Login": (BuildContext context) => login(),
      "SignUp": (BuildContext context) => signup(),
    }
    );
  }
}
