import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/login_counsellor.dart';
import 'package:raabta_fyp/User/login_user.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/RaabtaLogo.png"),
                  height: 150,
                  width: 150,
                ),
                const Image(
                  image: AssetImage("assets/images/Cover.png"),
                  // height: 200,
                  // width: 200,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 32.0, bottom: 18.0),
                  child: Text("Welcome!\nStart your journey", style: TextStyle(fontSize: 20 ),textAlign: TextAlign.center,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginUser()));
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff006A6A),
                        minimumSize: const Size(85, 40),
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xff100D57)
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                    ),
                      child: const Text("User", style: TextStyle(fontSize: 22),),
                    ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginCounsellor()));
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFFFFF),
                    minimumSize: const Size(120, 40),
                    side: const BorderSide(
                        width: 1,
                        color: Color(0xff100D57)
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text("Counsellor", style: TextStyle(fontSize: 22, color: Color(0xff006A6A)),),
                ),


              ],
            ),
          ),
        ),
      )
    );
  }
}
