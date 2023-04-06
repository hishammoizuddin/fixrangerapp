import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fixranger_app/database/data.dart';
import 'package:flutter/material.dart';
import 'package:fixranger_app/main.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';

class homepage extends StatefulWidget {
  homepage({required this.title, required this.index});

  final String title;
  final int index;
  @override
  State<homepage> createState() => homepageState();
}

class homepageState extends State<homepage> {
  List<int> indices = [0,1,2,3,4];

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Colors.purpleAccent[50],
      drawer: NavDrawer(
        text: user.email!,
      ),
      body: mainBody(context),
    );
  }

  Widget mainBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // Topmost SliverAppBar
          collapsedHeight: 75,
          expandedHeight: 150,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(60),
            ),
          ),
          pinned: true,
          centerTitle: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            // background: Image.asset(
            //   'assets/misc/appbar_logo.png',
            //   fit: BoxFit.cover,
            // ),
            background: null,
            title: Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'airstrike',
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 20,
        )),

        SliverToBoxAdapter(
            child: Center(
                child: Text(
          "Welcome to Fixranger\'s user portal. choose your desired service from the categories below",
          textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ))),

        SliverToBoxAdapter(
            child: SizedBox(
          height: 20,
        )),

        SliverAppBar(
          // Indoor SliverAppBar
          toolbarHeight: 20,
          collapsedHeight: 20,
          expandedHeight: 50,
          automaticallyImplyLeading: false,
          pinned: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
              top: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.brown,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              servicesSlivers[0],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        
        buildIndoorList(context),

        SliverToBoxAdapter(
              child: SizedBox(
            height: 20,
          ),
        ),


        SliverAppBar( // Outdoor SliverAppBar
          toolbarHeight: 20,
          collapsedHeight: 20,
          expandedHeight: 50,
          automaticallyImplyLeading: false,
          pinned: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
              top: Radius.circular(20),
            ),
          ),
          backgroundColor: Colors.green.shade600,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              servicesSlivers[1],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),

        buildOutdoorList(context),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),

        SliverToBoxAdapter(
          child: Center(child: Text("Cannot find what you are looking for?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),

        SliverToBoxAdapter(
          child: Center(
            child: SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                // onPressed: () => showDialog<String>(
                //   context: context,
                //   builder: (BuildContext context) => myDialogBox(context),
                // ),
                onPressed: (){},
                child: Text("Suggest Here", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),

      ],
    );
  }

  Widget buildIndoorList(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        width: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var i in indices) itemBuilder(context, i, indoorImages, indoorServices),
          ],
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int indexVal, var imgList, var servList) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: InkWell(
        child: Container(
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
          width: 260,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imgList[indexVal],
                    width: 170,
                    height: 170,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 20,),
                Text(servList[indexVal], style: TextStyle(fontSize: 25, color: Colors.white),),
              ],
            ),
          ),
        ),
        onTap: (){},
      ),
    );
  }

  Widget buildOutdoorList(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        width: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var i in indices) itemBuilder(context, i, outdoorImages, outdoorServices),
          ],
        ),
      ),
    );
  }

  // Widget myDialogBox(BuildContext context) {
  //   return AlertDialog(
  //     title: const Text('AlertDialog Title'),
  //     content: const Text('AlertDialog description'),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () => Navigator.pop(context, 'Cancel'),
  //         child: const Text('Cancel'),
  //       ),
  //       TextButton(
  //         onPressed: () => Navigator.pop(context, 'OK'),
  //         child: const Text('OK'),
  //       ),
  //     ],
  //   );
  // }

}
