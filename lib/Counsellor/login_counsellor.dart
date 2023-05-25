import 'dart:io';

import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/appointment_counsellor.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:raabta_fyp/Counsellor/home_counsellor.dart';
import 'package:raabta_fyp/Counsellor/navbar_counsellor.dart';
import 'package:raabta_fyp/Counsellor/profile_counsellor.dart';
import 'package:raabta_fyp/Counsellor/viewprofile_counsellor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';

import '../helper/Dialogs.dart';


class LoginCounsellor extends StatefulWidget {
  const LoginCounsellor({Key? key}) : super(key: key);

  @override
  State<LoginCounsellor> createState() => _LoginCounsellorState();
}

class _LoginCounsellorState extends State<LoginCounsellor> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  _handleSignIn()async{
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((UserCredential) async {
      Navigator.pop(context);
        if(UserCredential != null){
          if(UserCredential.additionalUserInfo!.isNewUser){
            print(UserCredential.user!.uid);
             await context.read<CounsellorProvider>().addCounsellor( new Counsellor(id: UserCredential.user!.uid, displayName: UserCredential.user!.displayName, email: UserCredential.user!.email, photoUrl: UserCredential.user!.photoURL,appointments: [],notes: []));
             await context.read<CounsellorProvider>().getCounsellorById(UserCredential.user!.uid);
             Navigator.pushAndRemoveUntil(context,
                 MaterialPageRoute(builder: (context) => const ProfileCounsellor()), (route) => false);
             await _googleSignIn.signOut();
          }
          else{
             try{
               await context.read<CounsellorProvider>().getCounsellorById(UserCredential.user!.uid);
               Navigator.pushAndRemoveUntil(context,
                   MaterialPageRoute(builder: (context) => const NavBarCounsellor()), (route) => false);
               await _googleSignIn.signOut();
             }
             catch(e){
               Dialogs.showSnackBar(context, "This account is already in use as User");
             }
          }
        }
      }
    );
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try{
      await InternetAddress.lookup("google.com");
      await _googleSignIn.signOut();
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);
    }
    catch(e){
      print('Internet Issue $e');
      Dialogs.showSnackBar(context, "Please check your internet");
      return null;
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
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
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: ElevatedButton(
                    onPressed: ()async{
                      _handleSignIn();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFFFFF),
                      minimumSize: const Size(100, 50),
                      side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
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
                  ),
                ),
              ],
            ),
          ),
        )
    );;
  }
}
