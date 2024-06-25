import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_firebase_project/auth/signup.dart';
import 'package:new_firebase_project/details.dart';
import 'package:new_firebase_project/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:new_firebase_project/auth/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '==========================================User is currently signed out!');
      } else {
        print('===========================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Colors.grey[50],
                titleTextStyle: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
                iconTheme: IconThemeData(color: Colors.orange))),
        home:
     
            (FirebaseAuth.instance.currentUser != null  ) ? home() : Login(),
        routes: {
          "signup": (context) => signup(),
          "Login": (context) => Login(),
          "home": (context) => home(),

        }
        );
  }
}
