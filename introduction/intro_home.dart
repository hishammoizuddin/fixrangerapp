//
// import 'package:flutter/material.dart';
// import 'package:fixranger_app/homepage/homepage.dart';
// import 'package:fixranger_app/homepage/rangerHomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fixranger_app/authentication/login.dart';
// import 'package:fixranger_app/homepage/NavDrawer.dart';
// import 'package:fixranger_app/authentication/authPage.dart';
// import 'package:fixranger_app/homepage/rangerNavDrawer.dart';
// import 'package:fixranger_app/homepage/rangerHomepage.dart';
// import 'package:fixranger_app/authentication/rangerLogin.dart';
// import 'package:fixranger_app/authentication/signup.dart';
// import 'package:fixranger_app/authentication/rangerAuth.dart';
// import 'package:fixranger_app/authentication/rangerSignup.dart';
// import 'package:fixranger_app/introduction/pages/page_1.dart';
// import 'package:fixranger_app/introduction/pages/page_2.dart';
// import 'package:fixranger_app/introduction/pages/page_3.dart';
// import 'package:fixranger_app/introduction/pages/page_4.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:page_transition/page_transition.dart';
//
//
// class intro_home extends StatefulWidget {
//   // login({required this.title, required this.index});
//   //
//   // final String title;
//   // final int index;
//
//
//   final Function() onClickedSignIn;
//   const intro_home({
//     Key? key, required this.onClickedSignIn,
//   }) : super(key: key);
//
//
//   @override
//   State<intro_home> createState() => introState();
// }
//
// class introState extends State<intro_home> {
//
//   final _controller = PageController();
//   bool isLogin = true;
//
//   void toggle() => setState(() {
//     isLogin = !isLogin;
//   });
//
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple[200],
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           // page view
//           SizedBox(
//             height: 500,
//             child: PageView(
//               controller: _controller,
//               children: const [
//                 Page1(),
//                 Page2(),
//                 Page3(),
//                 // Page4(),
//               ],
//             ),
//           ),
//
//           ElevatedButton(onPressed: (){
//             Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: signup(onClickedSignIn: toggle,)));
//           }, child: Text("Sign Up")),
//
//           // dot indicators
//           SmoothPageIndicator(
//             controller: _controller,
//             count: 3,
//             effect: JumpingDotEffect(
//               activeDotColor: Colors.deepPurple,
//               dotColor: Colors.deepPurple.shade100,
//               dotHeight: 30,
//               dotWidth: 30,
//               spacing: 16,
//               //verticalOffset: 50,
//               jumpScale: 3,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Future signUp() async {
//   //   final isValid = formKey.currentState!.validate();
//   //   if(!isValid) return;
//   //   try {
//   //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//   //       email: emailController.text.trim(),
//   //       password: pwdController.text.trim(),
//   //     );
//   //   } on FirebaseAuthException catch (e) {
//   //     print(e);
//   //   }
//   // }
// }