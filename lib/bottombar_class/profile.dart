import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hama_app1/firebase/SIGNUP.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseService service = new FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(user!.email.toString()),
            Text(user!.displayName.toString()),
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 20,
            )
          ],
        )));
  }
}
