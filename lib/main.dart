import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expandable Listview"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              checkSMSPermission();
            },
            child: Text("Ask Permission"),
          ),
        ));
  }

  void checkSMSPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus = await Permission.camera.request();
      print("permissionStatus ${permissionStatus.isGranted}");
    } else {
      // access the resoruce
    }
  }

}




