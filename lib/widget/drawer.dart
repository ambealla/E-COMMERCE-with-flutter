
import 'package:flutter/material.dart';
import 'package:hama_app1/firebase/SIGNUP.dart';
import 'package:hama_app1/main.dart';

class draw extends StatefulWidget {
  const draw({Key? key}) : super(key: key);

  @override
  _drawState createState() => _drawState();
}

class _drawState extends State<draw> {
  @override
  FirebaseService service = new FirebaseService();
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset("asset/img/storeino-logo-fr-1.png"),
          ),
          ListTile(
            title: Text('Setting'),
            leading: Icon(Icons.settings),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () {service.signOutFromGoogle();
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));


            },
          ),
        ],
      ),
    );
  }
}
