import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igcestaff/component/singlepost.dart';

class studentlist extends StatefulWidget {
  @override
  _studentlistState createState() => _studentlistState();
}

class _studentlistState extends State<studentlist> {
  String Name, Examno, Password;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text("Students List"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((document){
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SinglePost(
                               Name: document['Name'],
                            )));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink[800],
                      foregroundColor: Colors.white,
                      child: Text(document['Examno'].toString().substring(10,12),
                      )
                    //list[i]['Nme'].toString().substring(0, 1).toUpperCase()),
                  ),
                  title: new Text(
                    document['Name'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: new Text(
                    document['Password'],
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }).toList(),

          );
        },
      ),
    );
  }
}