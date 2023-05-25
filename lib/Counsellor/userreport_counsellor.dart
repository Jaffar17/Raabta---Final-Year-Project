import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import '../Models/user/personality_test.dart';
import '../Models/user/user_model.dart';
import '../controllers/counsellor/counsellor_provider.dart';

class UserReportCounsellor extends StatefulWidget {
  UserModel user;

  UserReportCounsellor({Key? key, required this.user}) : super(key: key);

  @override
  State<UserReportCounsellor> createState() => _UserReportCounsellorState();
}

class _UserReportCounsellorState extends State<UserReportCounsellor> {
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
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, bottom: 8, right: 60, left: 60),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Color(0xFFF6BD12), width: 2))),
                child: const Text(
                  "User Report",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "MontserratMedium",
                    //fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 15, left: 10, right: 10),
              child: Text(
                "Emotion Analysis",
                style: TextStyle(fontFamily: "MontserratMedium", fontSize: 22),
              ),
            ),
            context.read<CounsellorProvider>().emotionDetectionResults!.isEmpty
                ? Center(
                  child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 20, right: 10, bottom: 10),
                        child: Text(
                          "No video recorded to show analysis.",
                          style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.blueGrey),
                        ),
                      ),
                    ),
                )
                : Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: PieChart(
                      dataMap: context
                          .read<CounsellorProvider>()
                          .emotionDetectionResults!,
                      colorList: [
                        Colors.red,
                        Colors.brown,
                        Colors.blue,
                        Colors.green,
                        Colors.grey,
                        Colors.purple,
                        Colors.yellow
                      ],
                    ),
                  ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 15, left: 10, right: 10),
                  child: Text(
                    "Personality Test Results",
                    style: TextStyle(fontFamily: "MontserratMedium", fontSize: 22),
                  ),
                ),
                _Evaluations(
                    widget.user.Ptest, context),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  // child: Text("Dominating Trait: " +widget.user.dominatingTrait, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              ],
            ),
            // NotRecode: PieChart(context.read<CounsellorProvider>().emotions!)
            //table(widget.user)
          ],
        ),
      ),
    ));
  }
}

Widget _Evaluations(PersonalityTestModel? evaluation, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          decoration: BoxDecoration(color: Color(0xffffcccc)),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: TableRowInkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              //this right here
                              child: Container(
                                height: 230,
                                // width: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 8, bottom: 12.0),
                                        child: Text(
                                            """Extroversion is the personality trait of seeking fulfillment from sources outside the self or in community. High scorers tend to be very social while low scorers prefer to work on their projects alone. """),
                                      ),
                                      SizedBox(
                                        width: 320.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());
                                              // Navigator.of(context, rootNavigator: true).pop();
                                              Navigator.pop(context);
                                              // Navigator.pop(context);
                                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarUser())); // We need to route back to counsellors screen, as of now not happening
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              const Color(0xff006A6A),
                                              minimumSize: const Size(80, 40),
                                              maximumSize: const Size(80, 40),
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xff006A6A)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(18),
                                              ),
                                            ),
                                            child: const Text(
                                              "CLOSE",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ),
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
                    child: Text(
                      "Extroversion >>",
                      style: TextStyle(fontSize:13, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Center(
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(evaluation!.extroversion.toString()),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Color(0xffCCE6FF)),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: TableRowInkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: 220,
                              // width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 12.0),
                                      child: Text(
                                          """Agreeableness reflects much individuals adjust their behavior to suit others. High scorers are typically polite and like people. Low scorers tend to 'tell it is like it is'."""),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());
                                            // Navigator.of(context, rootNavigator: true).pop();
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarUser())); // We need to route back to counsellors screen, as of now not happening
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff006A6A),
                                            minimumSize: const Size(80, 40),
                                            maximumSize: const Size(80, 40),
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xff006A6A)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "CLOSE",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
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
                  child: Text(
                    'Agreeableness >>',
                    style: TextStyle(fontSize:13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(evaluation!.Agreeableness.toString()),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Color(0xffBDFCC9)),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: TableRowInkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: 220,
                              // width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 12.0),
                                      child: Text(
                                        """Conscientiousness is the personality trait of being honest and hardworking. High scorers tend to follow rules and prefer clean homes. Low scorers may be messy and cheat others.""",
                                      ),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());
                                            // Navigator.of(context, rootNavigator: true).pop();
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarUser())); // We need to route back to counsellors screen, as of now not happening
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff006A6A),
                                            minimumSize: const Size(80, 40),
                                            maximumSize: const Size(80, 40),
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xff006A6A)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "CLOSE",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
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
                  child: Text(
                    'Conscientiousness >>',
                    style: TextStyle(fontSize:13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(evaluation!.conscientiousness.toString()),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Color(0xffD3D3D3)),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: TableRowInkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: 180,
                              // width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 12.0),
                                      child: Text(
                                          """Neuroticism is the personality trait of being emotional."""),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());
                                            // Navigator.of(context, rootNavigator: true).pop();
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarUser())); // We need to route back to counsellors screen, as of now not happening
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff006A6A),
                                            minimumSize: const Size(80, 40),
                                            maximumSize: const Size(80, 40),
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xff006A6A)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "CLOSE",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
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
                  child: Text(
                    'Neuroticism >>',
                    style: TextStyle(fontSize:13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(evaluation!.neurotocism.toString()),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          decoration: BoxDecoration(color: Color(0xffBFEFFF)),
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: TableRowInkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: 230,
                              // width: 400,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 12.0),
                                      child: Text(
                                          """Openness to experience is the personality trait of seeking new experience and intellectual pursuits. High scores may day dream a lot. Low scorers may be very down to earth."""),
                                    ),
                                    SizedBox(
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());
                                            // Navigator.of(context, rootNavigator: true).pop();
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarUser())); // We need to route back to counsellors screen, as of now not happening
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xff006A6A),
                                            minimumSize: const Size(80, 40),
                                            maximumSize: const Size(80, 40),
                                            side: const BorderSide(
                                                width: 1,
                                                color: Color(0xff006A6A)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "CLOSE",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
                                          ),
                                        ),
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
                  child: Text(
                    'Openness >>',
                    style: TextStyle(fontSize:13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Center(
              child: TableCell(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(evaluation!.openess.toString()),
                ),
              ),
            ),
          ],
        ),
        // Text("Dominating Trait: Conscientiousness"),
      ],
    ),
  );
}

