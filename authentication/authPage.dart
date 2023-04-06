import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/authentication/login.dart';
import 'package:fixranger_app/authentication/signup.dart';
import 'package:fixranger_app/introduction/intro_home.dart';


class authPage extends StatefulWidget {
  @override
  State<authPage> createState() => authState();
}

class authState extends State<authPage> {
  bool isLogin = true;

  Widget build(BuildContext context) {
    if (isLogin) {
      return login( onClickedSignUp: toggle);
    } else {
      // return signup(onClickedSignIn: toggle);
      return signup(onClickedSignIn: toggle);
    }
  }

  void toggle() => setState(() {
    isLogin = !isLogin;
  });
}
