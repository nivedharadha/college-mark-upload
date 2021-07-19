import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:igcestaff/component/addstudent.dart';
import 'package:igcestaff/component/commonpost.dart';
import 'package:igcestaff/component/studentlist.dart';
import 'package:igcestaff/screens/login.dart';

class menu extends StatefulWidget {

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    Navigator.push(context, MaterialPageRoute(builder : (context) => login()));
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
                      Align(
                        alignment : Alignment.topRight,
                        child: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: Text("SignOut"),
                                value: 1,
                            ),
                          ],
                          onSelected: (result){
                            if(result ==1){
                              signOut();
                            }
                          },
                        ),
                      ),
                      new Align(alignment: Alignment.topLeft,
                          child :
                          Text(
                            " Home",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 48
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
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => studentlist()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.pink[800],
                                        Colors.pink[600]
                                      ]
                                  )
                              ),
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Student List",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => commonpost()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.pink[800],
                                        Colors.pink[600]
                                      ]
                                  )
                              ),
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Common Post",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => addstudent()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  gradient: new LinearGradient(
                                      colors: [
                                        Colors.pink[800],
                                        Colors.pink[600]
                                      ]
                                  )
                              ),
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "Add Student",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
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

