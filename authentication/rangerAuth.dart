import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/authentication/login.dart';
import 'package:fixranger_app/authentication/signup.dart';
import 'package:fixranger_app/homepage/rangerNavDrawer.dart';
import 'package:fixranger_app/homepage/rangerHomepage.dart';
import 'package:fixranger_app/authentication/rangerLogin.dart';
import 'package:fixranger_app/authentication/rangerAuth.dart';
import 'package:fixranger_app/authentication/rangerSignup.dart';

class rangerAuth extends StatefulWidget {

  @override
  State<rangerAuth> createState() => rangerAuthState();
}

class rangerAuthState extends State<rangerAuth> {
  bool rangerIsLogin = true;
  Widget build(BuildContext context) {
    if (rangerIsLogin) {
      return rangerLogin( onClickedSignUp: rangerToggle);
    } else {
      return rangerSignup(onClickedSignIn: rangerToggle);
    }
  }

  void rangerToggle() => setState(() {
    rangerIsLogin = !rangerIsLogin;
  });
}
