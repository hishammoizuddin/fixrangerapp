import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/database/data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fixranger_app/database/data.dart';

class devZone extends StatefulWidget {
  devZone({required this.title, required this.index});

  final String title;
  final int index;
  @override
  State<devZone> createState() => devState();
}

class devState extends State<devZone> {
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
              Container(
                height: 250,
                width: 250,
                child: FittedBox(
                  child: Image.asset('assets/hisham.png'),
                  fit: BoxFit.fill,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 8)
                ),
              ),
              SizedBox(height: 50,),
              Center(child: Text(aboutDev, textAlign: TextAlign.center, style: TextStyle(fontSize: 18),)),
              SizedBox(height: 30,),

              for (int i = 0; i < 3; i++) buildClickableLinks(context, i),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildClickableLinks (BuildContext context, int siteIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 80,),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.deepPurple.withOpacity(0.8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 6,
                blurRadius: 8,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: SizedBox(
            height: 40,
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              ),
              onPressed: () { _launchLink(siteIndex); },
              child: Text(socials[siteIndex], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
          ),
        ),

      ],
    );
  }


  _launchLink(int siteIndex) async {
    final url = Uri.parse(urls[siteIndex]);
    await launchUrl(url);
  }



}
