

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hama_app1/HomePage.dart';
import 'package:hama_app1/welcome%20page.dart';
import 'package:hama_app1/widget/theme.dart';
import 'package:splashscreen/splashscreen.dart';

import 'bloc/quantitébloc/quantitébloc.dart';
import 'bloc/test/counter_bloc.dart';
import 'bloc/test/counter_state.dart';
import 'firebase/SIGNUP.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeData = Themeee.get();
    return FutureBuilder(
      builder: (context, snapshot) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext) => Counter_Bloc(
                InitialState() ,
              ),
            ),BlocProvider(
              create: (BuildContext) => Quantitebloc(
                InitialStat(quantity: 1)
              ),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'hmaza',
            theme: themeData,
            initialRoute: '/splach',
            routes: Navigate.routes,
          ),
        );
      },
    );
  }
}


class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {

    '/sign-in': (context) => SignInPage(),
    '/home': (context) => HomePage(),
    '/splach': (context) => IntroScreen(),
  };
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? result = FirebaseAuth.instance.currentUser;
    return new SplashScreen(
      navigateAfterSeconds: result != null ? HomePage() : WelcomePage(),
      seconds: 2,
      title: new Text(
        'Welcome To our APP!',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset('asset/assetes/signin-image.jpg', fit: BoxFit.scaleDown),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("flutter"),
      loaderColor: Colors.red, loadingTextPadding: EdgeInsets.zero, useLoader: false, loadingText: Text("version 1.0.1"),);
  }
}