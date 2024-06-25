import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_firebase_project/auth/signup.dart';
import 'package:new_firebase_project/components/custombuttomauth.dart';
import 'package:new_firebase_project/components/customlogoauth.dart';
import 'package:new_firebase_project/components/textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController passowrd = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.of(context).pushReplacementNamed("home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                ),
                customlogoauth(),
                Container(
                  height: 20,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Container(
                  height: 10,
                ),
                Text(
                  "login to continue using this app",
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                customtextform(
                    hinttext: "enter your email", mycontroler: email),
                Container(
                  height: 20,
                ),
                Text(
                  "passowrd",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                customtextform(
                    hinttext: "enter passowrd", mycontroler: passowrd),
                InkWell(
                  onTap: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email.text);
                  },
                  child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        "forget password ?",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  height: 10,
                ),
              ],
            ),
            custombuttomauth(
              Title: "login",
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email.text, password: passowrd.text);
                  if (credential.user!.emailVerified) {
                    Navigator.of(context).pushReplacementNamed("home");
                  } else {
                    print('plz verify your email.');
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
            ),
            Container(
              height: 20,
            ),

            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login with google",
                    style: TextStyle(color: Colors.white),
                  ),
                  Image.asset("images/google.png", height: 30, width: 30),
                ],
              ),
              color: Colors.red[700],
            ),

            Container(
              height: 20,
            ),
            // Text("don't have account?",textAlign: TextAlign.center,),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("signup");
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Don't have account ?"),
                  TextSpan(
                      text: "Register",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold))
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
