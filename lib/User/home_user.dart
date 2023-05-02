import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 125, bottom: 15, left: 10, right: 10),
                  child: Text("Get Insights about yourself", style: TextStyle(fontFamily: "MontserratMedium", fontSize: 20),),
                ),
                Text("Record a 1-minute video of yourself giving \na small introduction of yourself", style: TextStyle(fontFamily: "MontserratMedium"),),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //      MaterialPageRoute(builder: (context) => const NavBarUser()));
                    },
                    child: const Text(
                      "RECORD ",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFFFFF)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff006A6A),
                      minimumSize: const Size(300, 50),
                      side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
