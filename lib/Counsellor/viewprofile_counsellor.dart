import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/editprofile_counsellor.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ViewprofileCounsellor extends StatefulWidget {
  const ViewprofileCounsellor({Key? key}) : super(key: key);

  @override
  State<ViewprofileCounsellor> createState() => _ViewprofileCounsellorState();
}

class _ViewprofileCounsellorState extends State<ViewprofileCounsellor> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 35, bottom: 35, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFF6BD12), width: 2))),
                    child: Text(
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
                    context.read<CounsellorProvider>().counsellor.photoUrl.toString(),
                    // width: 150,
                    // height: 180,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 6.0, top: 10),
                    child: Text(context.read<CounsellorProvider>().counsellor.displayName.toString(), style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),)
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 10.0),
                    child: Text(context.read<CounsellorProvider>().counsellor.specialisation.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),)
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EditProfileCounsellor()));
                            //
                          },
                          child: Text("EDIT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff006A6A),
                            minimumSize: Size(120, 50),
                            // side: BorderSide(
                            //     width: 1,
                            //     color: Color(0xff100D57)
                            // ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: ElevatedButton(
                          onPressed: () async{
                            Navigator.pop(context);
                            await _googleSignIn.signOut();
                          },
                          child: Text("LOGOUT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF93535),
                            minimumSize: Size(120, 50),
                            // side: BorderSide(width: 1, color: Color(0xff006A6A)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
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
