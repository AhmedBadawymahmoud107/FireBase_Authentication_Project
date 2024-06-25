import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_firebase_project/components/custombuttomauth.dart';
import 'package:new_firebase_project/components/customlogoauth.dart';
import 'package:new_firebase_project/components/textformfield.dart';
import 'package:new_firebase_project/home.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _LoginState();
}

class _LoginState extends State<signup> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController passowrd = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formstate,
              child: Column(
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
                    "signup",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "signup to continue using this app",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  customtextform(
                      hinttext: "enter your Username", mycontroler: username),
                  Container(
                    height: 10,
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
                  Container(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        "forget password ?",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 14),
                      )),
                  Container(
                    height: 10,
                  ),
                ],
              ),
            ),
            custombuttomauth(
              Title: "Sign up ",
              onPressed: () async {
                if (formstate.currentState!.validate()) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: passowrd.text,
                    );
                    Navigator.of(context).pushReplacementNamed("Login");
                    FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 20,
            ),
            // Text("don't have account?",textAlign: TextAlign.center,),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("Login");
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Have account ?"),
                  TextSpan(
                      text: "Login",
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
