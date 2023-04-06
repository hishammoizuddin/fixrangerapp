import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/helpPage.dart';
import 'package:fixranger_app/devZone.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({required this.text});
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
            title: Text('About Developer'),
            // Within the `FirstRoute` widget
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => devZone(title: "About Developer", index: 3,)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            // onTap: () => FirebaseAuth.instance.signOut(),
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => myDialogBox(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDialogBox(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirm Action'),
      content: const Text('Do you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}