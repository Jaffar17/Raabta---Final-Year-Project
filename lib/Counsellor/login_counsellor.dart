import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/appointment_counsellor.dart';
import 'package:raabta_fyp/Counsellor/home_counsellor.dart';
import 'package:raabta_fyp/Counsellor/viewprofile_counsellor.dart';

class LoginCounsellor extends StatefulWidget {
  const LoginCounsellor({Key? key}) : super(key: key);

  @override
  State<LoginCounsellor> createState() => _LoginCounsellorState();
}

class _LoginCounsellorState extends State<LoginCounsellor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/RaabtaLogo.png"),
                  height: 150,
                  width: 150,
                ),
                Image(
                  image: AssetImage("assets/images/Cover.png"),
                  // height: 200,
                  // width: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 18.0),
                  child: Text("Welcome!\nStart your journey", style: TextStyle(fontSize: 20 ),textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeCounsellor()));
                      //
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In with ",
                          style: TextStyle(fontSize: 22, color: Color(0xff006A6A)),
                        ),
                        Image(
                          image: AssetImage("assets/images/googleLogo.png"),
                          height: 38,
                          //width: 30,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFFFFF),
                      minimumSize: Size(100, 50),
                      side: BorderSide(width: 1, color: Color(0xff006A6A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );;
  }
}
