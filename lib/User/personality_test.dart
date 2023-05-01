import 'package:flutter/material.dart';
import 'package:raabta_fyp/User/navbar_user.dart';

class PersonalityTest extends StatefulWidget {
  const PersonalityTest({Key? key}) : super(key: key);

  @override
  State<PersonalityTest> createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  double q1Value = 0;
  double q2Value = 0;
  double q3Value = 0;
  double q4Value = 0;
  double q5Value = 0;
  double q6Value = 0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ptestBackground.png"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Personality Test",
                        style: TextStyle(
                          fontSize: 36,
                          fontFamily: "MontserratMedium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Help us evaluate your Personality",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                 Expanded(
                   flex: 10,
                   child: ListView(
                      shrinkWrap: true,
                     //axisDirection: AxisDirection.down,
                     //child: Container(
                       //child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q1. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q1Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q1Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q1Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q2. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q2Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q2Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q2Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q3. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q3Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q3Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q3Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q4. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q4Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q4Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q4Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q5. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q5Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q5Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q5Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                             child: Container(
                               decoration: BoxDecoration(
                                   border: Border.all(color: const Color(0xff006A6A)),
                                   borderRadius: BorderRadius.circular(10)
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left: 18.0, top: 8),
                                     child: Text("Q6. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q6Value,
                                         max: 10,
                                         divisions: 10,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q6Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q6Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           )
                         ],
                       //),
                    //),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NavBarUser()));
                      },
                      child: const Text(
                        "NEXT ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006A6A)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFFFFFF),
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
            )
        )
    );
  }
}

// Add this line to login user class for routing check
// Navigator.push(context,
//     MaterialPageRoute(builder: (context) => PersonalityTest()));