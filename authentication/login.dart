import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class login extends StatefulWidget {
  // login({required this.title, required this.index});
  //
  // final String title;
  // final int index;


  final VoidCallback onClickedSignUp;
  const login({
    Key? key, required this.onClickedSignUp,
}) : super(key: key);


  @override
  State<login> createState() => loginState();
}

class loginState extends State<login> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();

  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "User Login / Sign Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email ID'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pwdController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton.icon(
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: Text('Log In', style: TextStyle(fontSize: 20)),
                onPressed: signIn,
                style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  text: "New User?  ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                      text: "Sign Up",
                      style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 250,
                width: 250,
                child: FittedBox(
                  child: Image.asset('assets/logo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwdController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
