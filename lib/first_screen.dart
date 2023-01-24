import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: Container(
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
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginUser()));
                },
                    child: Text("User", style: TextStyle(fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff006A6A),
                      minimumSize: Size(85, 40),
                      side: BorderSide(
                        width: 1,
                        color: Color(0xff100D57)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                  ),
                  ),
              ),
              ElevatedButton(onPressed: (){
                
              },
                child: Text("Counsellor", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFFFFFF),
                  minimumSize: Size(120, 40),
                  side: BorderSide(
                      width: 1,
                      color: Color(0xff100D57)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),


            ],
          ),
        ),
      )
    );
  }
}
