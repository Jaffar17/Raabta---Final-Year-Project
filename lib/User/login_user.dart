import 'dart:io';

import 'package:flutter/material.dart';
import '../controllers/user/user_provider.dart';
import 'package:raabta_fyp/User/personality_test.dart';
import 'package:raabta_fyp/User/profile_user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'package:raabta_fyp/Models/user/personality_test.dart';
import '../helper/Dialogs.dart';
import 'home_user.dart';


import 'navbar_user.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading=false;

  _handleSignIn()async{
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((UserCredential) async {
      Navigator.pop(context);
      if(UserCredential != null){
        if(UserCredential.additionalUserInfo!.isNewUser){
          print(UserCredential.user!.uid);
          await context.read<UserProvider>().addUser( new UserModel(id: UserCredential.user!.uid, fullName: UserCredential.user!.displayName, email: UserCredential.user!.email, photoUrl: UserCredential.user!.photoURL,appointments: [],Ptest: new PersonalityTestModel(extroversion: 0.0, Agreeableness: 0.0, conscientiousness: 0.0, neurotocism: 0.0, openess: 0.0)));
          await context.read<UserProvider>().getUser(UserCredential.user!.uid);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ProfileUser()));
          //await _googleSignIn.signOut();
        }
        else{
          try {
            await context.read<UserProvider>().getUser(UserCredential.user!.uid);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const NavBarUser()));
            //await _googleSignIn.signOut();
          }
          catch(e){
            Dialogs.showSnackBar(context, "This email is registered as a Counsellor");
          }

        }
      }



    }
    );
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try{
      //await InternetAddress.lookup("google.com");
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
          body: isLoading?Center(child:CircularProgressIndicator()):Container(
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
                    onPressed: ()async {
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
    );
  }


}
