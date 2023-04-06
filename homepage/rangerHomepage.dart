import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/homepage/rangerNavDrawer.dart';
import 'package:fixranger_app/homepage/rangerHomepage.dart';
import 'package:fixranger_app/authentication/rangerLogin.dart';
import 'package:fixranger_app/authentication/rangerAuth.dart';
import 'package:fixranger_app/authentication/rangerSignup.dart';

class rangerHomepage extends StatefulWidget {
  rangerHomepage({required this.title, required this.index});

  final String title;
  final int index;
  @override
  State<rangerHomepage> createState() => rangerHomepageState();
}

class rangerHomepageState extends State<rangerHomepage> {
  Widget build(BuildContext context) {
    final ranger = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        centerTitle: true,
        toolbarHeight: 90,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 35, fontFamily: "airstrike"),
        ),
      ),
      drawer: rangerNavDrawer(text: ranger.email!,),
      body: mainBody(context),
    );
  }

  Widget mainBody(BuildContext context) {
    return Container();
  }
}
