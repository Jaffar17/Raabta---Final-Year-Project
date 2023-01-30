import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}
//Test Comment
class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0,  bottom: 70.0),
                child: Image.asset(
                  "assets/images/ProfileHeading.png",
                   width: 150,
                   height: 200,
                ),
              ),
              ],
            ),),
    ));
  }
}
