import 'package:flutter/material.dart';
import 'package:raabta_fyp/User/editprofile_user.dart';
import 'package:raabta_fyp/User/login_user.dart';
import 'package:raabta_fyp/User/user_chat_test.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raabta_fyp/first_screen.dart';
class ViewprofileUser extends StatefulWidget {
  const ViewprofileUser({Key? key}) : super(key: key);

  @override
  State<ViewprofileUser> createState() => _ViewprofileUserState();
}

class _ViewprofileUserState extends State<ViewprofileUser> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 75, bottom: 35, right: 20, left: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "MontserratMedium",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0),
                child: Image.network(
                  context.read<UserProvider>().user.photoUrl.toString(),
                  // width: 150,
                  // height: 180,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 6.0, top: 10),
                  child: Text(
                    context.read<UserProvider>().user.fullName.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 10.0),
                  child: Text(
                    context.read<UserProvider>().user.preference.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreenUser()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditprofileUser()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff006A6A),
                          minimumSize: Size(120, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "EDIT",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: ElevatedButton(
                        onPressed: () async{
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20.0)), //this right here
                                  child: Container(
                                    height: 180,
                                    // width: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: Text(
                                              'Are you sure you want to log out?', style: TextStyle(fontSize: 14),),
                                          ),

                                          SizedBox(
                                            width: 320.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      // Navigator.of(context, rootNavigator: true).pop();
                                                      // Navigator.pop(context);
                                                      // Navigator.pop(context);
                                                      await _googleSignIn.signOut();
                                                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> FirstScreen()), (route) => false);
                                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CounsellorsList())); // We need to route back to counsellors screen, as of now not happening
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: Colors.red,
                                                      // minimumSize: const Size(80, 40),
                                                      // maximumSize: const Size(80, 40),
                                                      side: const BorderSide(width: 1, color: Colors.red),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "YES",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Color(0xffFFFFFF)),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      // Navigator.of(context, rootNavigator: true).pop();
                                                      // Navigator.pop(context);
                                                      Navigator.pop(context);
                                                      // await _googleSignIn.signOut();
                                                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> FirstScreen()), (route) => false);
                                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CounsellorsList())); // We need to route back to counsellors screen, as of now not happening
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color(0xff006A6A),
                                                      // minimumSize: const Size(80, 40),
                                                      // maximumSize: const Size(80, 40),
                                                      side: const BorderSide(width: 1, color:  const Color(0xff006A6A)),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(18),
                                                      ),
                                                    ),
                                                    child: const Text(
                                                      "NO",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold,
                                                          color: Color(0xffFFFFFF)),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ),
                                            // color: const Color(0xFF1BC0C5),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF93535),
                          minimumSize: Size(120, 50),
                          // side: BorderSide(width: 1, color: Color(0xff006A6A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          "LOGOUT",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
