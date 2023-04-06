import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fixranger_app/introduction/intro_home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fixranger_app/introduction/pages/page_1.dart';
import 'package:fixranger_app/introduction/pages/page_2.dart';
import 'package:fixranger_app/introduction/pages/page_3.dart';

class signup extends StatefulWidget {
  // login({required this.title, required this.index});
  //
  // final String title;
  // final int index;


  final Function() onClickedSignIn;
  const signup({
    Key? key, required this.onClickedSignIn,
  }) : super(key: key);


  @override
  State<signup> createState() => signupState();
}

class signupState extends State<signup> {

  final _controller = PageController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: buildSignUp(context));
  }

  Widget buildSignUp (BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 250,
                  width: 400,
                  child: FittedBox(
                    child: Image.asset('assets/misc/fixranger2.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Login / Sign Up",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => email != null && EmailValidator.validate(email) ? 'Enter valid email' : null,
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Email ID'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (pwd) => pwd != null && pwd.length < 6 ? 'Enter atleast 6 characters' : null,
                  controller: pwdController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(
                  height: 45,
                ),
                ElevatedButton.icon(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 32,
                  ),
                  label: Text('Sign Up', style: TextStyle(fontSize: 20)),
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    text: "Already registered?  ",
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                        text: "Log In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: pwdController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
