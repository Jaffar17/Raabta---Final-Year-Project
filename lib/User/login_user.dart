import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        // body: Background(),
        //Background
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          //Background
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Signin.png",
                // width: 100,
                // height: 200,
              ),
              TextField(
                
              ),
            ],
          ),
        ),

    ),);
  }
}

// class Background extends StatelessWidget {
//   const Background({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
//       child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 "assets/images/Signin.png",
//                 // width: 100,
//                 // height: 200,
//               ),
//             ],
//       ),
//     );
//   }
// }
//
