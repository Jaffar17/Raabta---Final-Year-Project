// import 'package:flutter/material.dart';
//
// class LoginUser extends StatefulWidget {
//   const LoginUser({Key? key}) : super(key: key);
//
//   @override
//   State<LoginUser> createState() => _LoginUserState();
// }
//
// class _LoginUserState extends State<LoginUser> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body:
//         // body: Background(),
//         //Background
//         Container(
//           width: MediaQuery.of(context).size.width,
//           //height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/Background.jpeg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           //Background
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 16.0, right: 16.0, top: 70.0, bottom: 70.0),
//                 child: Image.asset(
//                   "assets/images/Signin.png",
//                   // width: 300,
//                   // height: 400,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 16.0, right: 16.0, top: 10.0, bottom: 13.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     labelStyle: TextStyle(color: Color(0xff006A6A)),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Color(0xff006A6A)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Color(0xff006A6A)),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 16.0, right: 16.0, top: 13.0, bottom: 50.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     labelStyle: TextStyle(color: Color(0xff006A6A)),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Color(0xff006A6A)),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(color: Color(0xff006A6A)),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 40, right: 40),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => LoginUser()));
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Sign In with ",
//                         style: TextStyle(fontSize: 22, color: Color(0xff006A6A)),
//                       ),
//                       Image(
//                         image: AssetImage("assets/images/googleLogo.png"),
//                         height: 38,
//                         //width: 30,
//                       )
//                     ],
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xffFFFFFF),
//                     minimumSize: Size(100, 50),
//                     side: BorderSide(width: 1, color: Color(0xff006A6A)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class Background extends StatelessWidget {
// //   const Background({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: MediaQuery.of(context).size.width,
// //       decoration: BoxDecoration(
// //           image: DecorationImage(
// //               image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
// //       child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               Image.asset(
// //                 "assets/images/Signin.png",
// //                 // width: 100,
// //                 // height: 200,
// //               ),
// //             ],
// //       ),
// //     );
// //   }
// // }
// //
