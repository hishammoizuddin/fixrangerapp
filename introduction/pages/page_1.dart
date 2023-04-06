import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              height: 600,
              width: 400,
              color: Colors.deepPurple[400],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset(
                            "assets/misc/handtools.png",
                            scale: 12,
                          ),

                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "assets/misc/fixranger2.png",
                                scale: 3,
                              )),
                        ]),
                    Text(
                      "Explore the different services offered on FixRanger, including repairs, decor, maintenance, and cleaning.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
