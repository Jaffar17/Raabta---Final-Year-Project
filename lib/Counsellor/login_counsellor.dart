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


class LoginCounsellor extends StatefulWidget {
  const LoginCounsellor({Key? key}) : super(key: key);

  @override
  State<LoginCounsellor> createState() => _LoginCounsellorState();
}

class _LoginCounsellorState extends State<LoginCounsellor> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                      {

                        final GoogleSignInAccount? user = await _googleSignIn.signIn();

                        final  GoogleSignInAuthentication? authentication = await user?.authentication;
                        if(authentication?.accessToken!=null && authentication?.idToken!=null) {
                          final credential = GoogleAuthProvider.credential(
                            accessToken: authentication?.accessToken,
                            idToken: authentication?.idToken,
                          );
                          UserCredential userCredential =
                              await _auth.signInWithCredential((credential));
                          if(userCredential.user != null){
                            if(userCredential.additionalUserInfo!.isNewUser){
                              await context.read<CounsellorProvider>().addCounsellor( new Counsellor(id: user!.id, displayName: user?.displayName, email: user!.email, photoUrl: user?.photoUrl,appointments: []));
                              await context.read<CounsellorProvider>().getCounsellorById(user.id);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const ProfileCounsellor()));
                               _googleSignIn.signOut();
                            }
                            else{
                              await context.read<CounsellorProvider>().getCounsellorById(user!.id);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const NavBarCounsellor()));
                              _googleSignIn.signOut();
                            }
                          }
                        }
                      }
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
