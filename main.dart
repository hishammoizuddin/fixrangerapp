import 'package:fixranger_app/homepage/homepage.dart';
import 'package:fixranger_app/homepage/rangerHomepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fixranger_app/authentication/login.dart';
import 'package:fixranger_app/homepage/NavDrawer.dart';
import 'package:fixranger_app/authentication/authPage.dart';
import 'package:fixranger_app/homepage/rangerNavDrawer.dart';
import 'package:fixranger_app/homepage/rangerHomepage.dart';
import 'package:fixranger_app/authentication/rangerLogin.dart';
import 'package:fixranger_app/authentication/rangerAuth.dart';
import 'package:fixranger_app/authentication/rangerSignup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fixranger_app/introduction/pages/page_1.dart';
import 'package:fixranger_app/introduction/pages/page_2.dart';
import 'package:fixranger_app/introduction/pages/page_3.dart';
import 'package:fixranger_app/introduction/pages/page_4.dart';
import 'package:fixranger_app/introduction/intro_home.dart';
import 'package:page_transition/page_transition.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FixRanger',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'FixRanger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int loginChoice = 0;
  final _controller = PageController();
  bool _isVisible = true;

  void showSignup() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildFirstScreen(context);
  }

  Widget buildIntro(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // page view
          SizedBox(
            height: 600,
            child: PageView(
              controller: _controller,
              children: const [
                Page1(),
                Page2(),
                Page3(flag: true,),
                Page4(),
              ],
            ),
          ),

          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Sign Up Now")),

          // dot indicators
          SmoothPageIndicator(
            controller: _controller,
            count: 4,
            effect: JumpingDotEffect(
              activeDotColor: Colors.deepPurple,
              dotColor: Colors.deepPurple.shade100,
              dotHeight: 30,
              dotWidth: 30,
              spacing: 16,
              // verticalOffset: 50,
              jumpScale: 1,
            ),
          ),
          
          Text("Swipe for more", style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }

  Widget buildFirstScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "FixRanger",
              style: TextStyle(
                  fontFamily: 'airstrike',
                  fontSize: 40,
                  color: Colors.deepPurple),
            ),
            SizedBox(
              height: 40,
            ),

            Container(
              height: 250,
              width: 250,
              child: FittedBox(
                child: Image.asset('assets/logo.png'),
                fit: BoxFit.fill,
              ),
            ),

            SizedBox(
              height: 40,
            ),

            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => buildClientLogin(context)),
                  );},
                  child: Text("Enter as a User", style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                )
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => buildRangerLogin(context)),
                    );
                  },
                  child: Text("Enter as a FixRanger", style: TextStyle(fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                )
            ),
            SizedBox(
              height: 40,
            ),

            RichText(
              text: TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 14,),
                text: "New User?  ",
                children: [
                  TextSpan(
                    text: "Learn More",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade,duration: Duration(seconds: 1), child: buildIntro(context)));
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildClientLogin(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return homepage(title: widget.title, index: 1);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error! Please try again"),
            );
          } else {
            // return login(title: "Login Page", index: 0);
            return authPage();
          }
        },
      ),
    );
  }

  Widget buildRangerLogin(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, rangerSnapshot) {
          if (rangerSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (rangerSnapshot.hasData) {
            return rangerHomepage(title: widget.title, index: 10);
          } else if (rangerSnapshot.hasError) {
            return Center(
              child: Text("Error! Please try again"),
            );
          } else {
            // return login(title: "Login Page", index: 0);
            return rangerAuth();
          }
        },
      ),
    );
  }
}
