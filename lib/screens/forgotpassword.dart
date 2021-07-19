import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igcestaff/screens/login.dart';

class fotgotpassword extends StatefulWidget {

  @override
  _fotgotpasswordState createState() => _fotgotpasswordState();
}

class _fotgotpasswordState extends State<fotgotpassword> {
  String _email;
  FirebaseAuth _auth =FirebaseAuth.instance;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      key: _scaffoldkey,
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
                            "Reset Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 38
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
                  child:Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          onChanged: (value) {
                            _email = value;
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
                              prefixIcon: Icon(Icons.email, color: Colors.grey[600],)
                          ),
                        ),
                        SizedBox(height: 80.0,),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () async{
                               _auth.sendPasswordResetEmail(email: _email);
                               _scaffoldkey.currentState.showSnackBar(SnackBar(
                                 content: Text("Password Reset email link is been sent"),
                                 action:SnackBarAction(
                                     label:"Success",
                                     onPressed:(){
                                       Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                                     },),));
                              },
                            color: Colors.pink[800],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

