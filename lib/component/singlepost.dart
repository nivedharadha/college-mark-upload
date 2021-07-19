import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igcestaff/firebase/firebase_api.dart';

class SinglePost extends StatefulWidget {
  String Name;
  SinglePost(
      {Key key,
        @required this.Name,})
      : super(key: key);


  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  UploadTask task;
  File file;
  String name;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final filename = file != null ? file.path :'No File Selected';
    name = widget.Name;
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.pink[800],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: selectFile,
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
                      "Select File",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                filename,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: uploadFile,
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
                      "Upload File",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              task != null ? buildUploadStatus(task) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async{

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if(result == null) return;
    final path= result.files.single.path;

    setState(() {
      file = File(path);
    });
  }

  Future uploadFile() async{
    if( file == null) return;

    final fileName = file.path ;
    final destination = '$name/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() => {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link : $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot){
      if(snapshot.hasData){
        final snap = snapshot.data;
        final  progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress *100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      }
      else{
        return Container();
      }
    },
  );
}
