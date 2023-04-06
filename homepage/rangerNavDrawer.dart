import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/helpPage.dart';
import 'package:fixranger_app/devZone.dart';
import 'package:fixranger_app/homepage/rangerNavDrawer.dart';
import 'package:fixranger_app/homepage/rangerHomepage.dart';
import 'package:fixranger_app/authentication/rangerLogin.dart';
import 'package:fixranger_app/authentication/rangerAuth.dart';
import 'package:fixranger_app/authentication/rangerSignup.dart';

class rangerNavDrawer extends StatelessWidget {
  rangerNavDrawer({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: null,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logo.png'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text(text),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => FirebaseAuth.instance.signOut(),
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About App'),
            // Within the `FirstRoute` widget
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => helpPage(title: "About FixRanger", index: 2,)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Developer\'s Zone'),
            // Within the `FirstRoute` widget
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => devZone(title: "Developer's Zone", index: 3,)),
              );
            },
          ),
        ],
      ),
    );
  }
}