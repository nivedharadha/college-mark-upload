import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class addstudent extends StatefulWidget {
  @override
  _addstudentState createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  String _stuname;
  String _examno;
  String _password;

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
                            "Add Student",
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
                  child:Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          onChanged: (value) {
                            _stuname = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person, color: Colors.grey[600],)
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextField(
                          onChanged: (value){
                            _examno = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: "Exam No",
                              prefixIcon: Icon(Icons.check_circle, color: Colors.grey[600],)
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextField(
                          onChanged: (value){
                            _password =value;
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
                        ),
                        SizedBox(height: 50),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              FirebaseFirestore.instance.collection('students').add({
                                'Name': _stuname,
                                'Examno': _examno,
                                'Password': _password,
                              }).then((value) => print("User Added")).catchError((error) => ("Failed to add user: $error"));
                            },
                            color: Colors.pink[800],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
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

