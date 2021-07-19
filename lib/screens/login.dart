import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igcestaff/screens/forgotpassword.dart';
import 'package:igcestaff/screens/menu.dart';
import 'package:igcestaff/screens/signup.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String _email, _password;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        print(user);
        Navigator.push(context, MaterialPageRoute(builder: (context) => menu()));
              }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async{
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try{
        await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      }catch (e) {
        showError(e.message);
        print(e);
      }
    }
  }

  showError(String errormessage){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink[800],
                Colors.pink[400]
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 36.0,horizontal: 24.0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Align(alignment: Alignment.topLeft,
                        child : Text(
                          " Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 46
                          ),
                        )),
                        SizedBox(height: 10,),
                        Text(
                          "  Welcome !",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w300
                          ),
                        )
                      ],
                    ),
                  ),
              ),
              Expanded(
                flex: 5,
                  child: Container(
                    width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                    child:Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                            children:<Widget> [
                        Padding(
                      padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 80.0,),
                        TextFormField(
                          validator: (input){
                            if(input.isEmpty) return 'Enter Email';
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            hintText: "E-Mail",
                            prefixIcon: Icon(Icons.email, color: Colors.grey[600],),
                          ),
                          onSaved: (input) => _email = input,
                        ),
                        SizedBox(height: 20.0,),
                        TextFormField(
                          validator: (input) {
                            if(input.length < 6)
                              return 'Provide minimum 6 Character';
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock, color: Colors.grey[600],)
                          ),
                          onSaved: (input) => _password = input,
                        ),
                        SizedBox(height: 10.0,),
                        Container(
                            alignment: Alignment.topRight,
                            child : GestureDetector(
                              onTap: () => {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => fotgotpassword()))
                              },
                            child :Text(
                              "Forget your password?",
                              style: TextStyle(
                                color: Colors.pink[800],
                                ),
                            ))),
                        SizedBox(height: 50),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: login,
                            color: Colors.pink[800],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                            alignment: Alignment.topCenter,
                            child : GestureDetector(
                                onTap: () => {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => signup()))
                                },
                                child :Text(
                                  "Don't have an account? SignUp",
                                  style: TextStyle(
                                      color: Colors.pink[800],
                                  ),
                                ))),
                      ],
                    ),
                    ),
                  ]),
                      )
                    )
                  )
              )
            ]
                  )
                    )
    )
    );

  }
}
