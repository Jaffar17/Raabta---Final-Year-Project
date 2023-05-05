import 'package:flutter/material.dart';
import 'package:raabta_fyp/User/navbar_user.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import 'package:provider/provider.dart';

class PersonalityTest extends StatefulWidget {
  const PersonalityTest({Key? key}) : super(key: key);

  @override
  State<PersonalityTest> createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  double q1Value = 1;
  double q2Value = 1;
  double q3Value = 1;
  double q4Value = 1;
  double q5Value = 1;
  double q6Value = 1;
  double q7Value = 1;
  double q8Value = 1;
  double q9Value = 1;
  double q10Value = 1;

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
                                     child: Text("Q1. I am the life of the party.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q1Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q2. I feel little concern for others.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q2Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q3. I am always prepared.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q3Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q4. I get stressed out easily.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q4Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q5. I have a rich vocabulary.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q5Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q6. I don't talk a lot.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q6Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
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
                                     child: Text("Q7. I am interested in people.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q7Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q7Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q7Value = value;
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
                                     child: Text("Q8. I leave my belongings around.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q8Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q8Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q8Value = value;
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
                                     child: Text("Q9. I am relaxed most of the time.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q9Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q9Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q9Value = value;
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
                                     child: Text("Q10. I have difficulty understanding abstract ideas.", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Slider(value: q10Value,
                                         min: 1,
                                         max: 5,
                                         divisions: 5,
                                         activeColor: const Color(0xff006A6A),
                                         //inactiveColor: Color(0xff006A6A),
                                         label: q10Value.round().toString(),
                                         onChanged: (double value){
                                           setState(() {
                                             q10Value = value;
                                           });
                                         }),
                                   ),

                                 ],
                               ),
                             ),
                           ),
                         ],
                       //),
                    //),
                   ),
                 ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                    child: ElevatedButton(
                      onPressed: () async{
                        await context.read<UserProvider>().personalityEvaluation([q1Value,q2Value,q3Value,q4Value,q5Value,q6Value,q7Value,q8Value,q9Value,q10Value]);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NavBarUser()));
                      },
                      child: const Text(
                        "SUBMIT ",
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