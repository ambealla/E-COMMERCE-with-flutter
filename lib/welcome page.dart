import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'homePage.dart';

class WelcomePage extends StatelessWidget {
  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Colors.white70, statusBarIconBrightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("asset/assetes/welcome.png",
                width: 150,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: Constants.textIntro,
                        style: TextStyle(
                          color: Constants.kBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        )),
                    TextSpan(
                        text: Constants.textIntroDesc1,
                        style: TextStyle(
                            color: Constants.kDarkBlueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                    TextSpan(
                        text: Constants.textIntroDesc2,
                        style: TextStyle(
                            color: Constants.kBlackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                  ])),
              SizedBox(height: size.height * 0.01),
              Text(
                Constants.textSmallSignUp,
                style: TextStyle(color: Constants.kDarkGreyColor),
              ),
              SizedBox(height: size.height * 0.1),
              SizedBox(
                width: size.width * 0.8,
                child: OutlinedButton(
                  onPressed: () {

                    Navigator.pushNamed(context, '/sign-in')
                    ;
                  },
                  child: Text(Constants.textStart),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Constants.kPrimaryColor),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none)),
                ),
              ),
              SizedBox(
                width: size.width * 0.8,
                child: OutlinedButton(
                  onPressed: () {

                    Navigator.pushNamed(context, '/sign-in')
                    ;
                  },
                  child: Text(
                    Constants.textSignIn,
                    style: TextStyle(color: Colors.blue),
                  ),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue  ),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black26),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none)),
                ),
              )
            ],
          ),
        ));
  }
}

class Constants {
  static Color kPrimaryColor = Colors.white;
  static Color kGreyColor = Colors.grey;
  static Color kBlackColor = Colors.black;
  static Color kDarkGreyColor = Colors.black26;
  static Color kDarkBlueColor = Colors.blueGrey;
  static String textSignIn = " Sign in ";
  static String textIntroDesc2 = " then you think ";
  static String textStart = "Get started";
  static String textSmallSignUp = "hello";
  static String textSignInGoogle = "sign in with google ";
  static String textIntro = " Growing your business is ";
  static String textIntroDesc1 = "Easier";
}


