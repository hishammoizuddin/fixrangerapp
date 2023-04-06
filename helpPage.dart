import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/database/data.dart';

class helpPage extends StatefulWidget {
  helpPage({required this.title, required this.index});

  final String title;
  final int index;
  @override
  State<helpPage> createState() => helpPageState();
}

class helpPageState extends State<helpPage> {
  Widget build(BuildContext context) {
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
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Center(child: Text(aboutApp, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
            ],
          ),
        ),
      ),
    );
  }
}
