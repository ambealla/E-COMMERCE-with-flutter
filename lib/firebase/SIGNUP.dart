import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../welcome page.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 3.0));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Constants.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/assetes/signin-image.jpg"),
            SIgnIn(),
          ],
        ),
      ),
    );
  }
}
class SIgnIn extends StatefulWidget {
  SIgnIn({Key? key}) : super(key: key);

  @override
  _SIgnInState createState() => _SIgnInState();
}

class _SIgnInState extends State<SIgnIn> {
  bool isLoading = false;
  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return !isLoading ? SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon:FaIcon(FontAwesomeIcons.google,color: Colors.white,),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          FirebaseService service = new FirebaseService();
          try {
            await service.signInwithGoogle();
            Navigator.pushNamedAndRemoveUntil(
                context, "/home", (route) => false);
          } catch (e) {
            if (e is FirebaseAuthException) {
              showMessage(e.message!);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: Text(
          Constants.textSignInGoogle,
          style: TextStyle(
              color: Constants.kBlackColor, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Constants.kGreyColor),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    ) : CircularProgressIndicator();
  }}


class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async{
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}