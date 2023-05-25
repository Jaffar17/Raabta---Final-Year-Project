import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Models/user/personality_test.dart';
import 'package:raabta_fyp/User/personality_test.dart';
import 'package:raabta_fyp/User/video_record.dart';

import '../controllers/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().getVideoResponse();
    context.read<UserProvider>().getDominantPersonality();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<UserProvider>().emotions;
    // List<PersonalityTestModel> PtestResults = context.read<UserProvider>().user.Ptest as List<PersonalityTestModel>;
    List<String> description = [
      """Extroversion (E) is the personality trait of seeking fulfillment from sources outside the self or
      in community. High scorers tend to be very social while low scorers prefer to work on their projects alone.""",
      """ Agreeableness (A) reflects much individuals adjust their behavior to suit others. High scorers are 
      typically polite and like people. Low scorers tend to 'tell it like it is'.""",
      """ Conscientiousness (C) is the personality trait of being honest and hardworking. High scorers
        tend to follow rules and prefer clean homes. Low scorers may be messy and cheat others.""",
      """ Neuroticism (N) is the personality trait of being emotional.""",
      """ Openness to Experience (O) is the personality trait of seeking new experience and intellectual
          pursuits. High scores may day dream a lot. Low scorers may be very down to earth."""
    ];

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
            padding: const EdgeInsets.only(top: 0),
            //yeha sey kaam agai start karna hai pie chart aur extra widget ka
            child: context.watch<UserProvider>().isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (context.read<UserProvider>().emotions!.isEmpty)?
                      _NotRecorded(context):
                           Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                                child: Text("Emotion Analysis", style: TextStyle(fontFamily: "MontserratMedium", fontSize: 22),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: _Emotion_Detection_Results(
                                    context.read<UserProvider>().emotions!),
                              ),
                            ],
                          ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10, right: 10),
                            child: Text(
                              "Personality Test Results",
                              style: TextStyle(
                                  fontFamily: "MontserratMedium", fontSize: 22),
                            ),
                          ),
                          _Evaluations(
                              context.read<UserProvider>().user.Ptest, context),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text("Dominating Trait: " +context.read<UserProvider>().dominatingTrait, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                          ),
                          // print(PtestResults);
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

Widget _Emotion_Detection_Results(Map<String, double> data) {
  return PieChart(dataMap: data, colorList: [Colors.red, Colors.brown, Colors.blue, Colors.green, Colors.grey, Colors.purple, Colors.yellow],);
}

Widget _NotRecorded(BuildContext context) {
  return Container(
      child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
        child: Text(
          "Get Insights about yourself",
          style: TextStyle(fontFamily: "MontserratMedium", fontSize: 22),
        ),
      ),
      Text(
        "Record a 1-minute video giving a small \n introduction of yourself",
        style: TextStyle(fontFamily: "MontserratMedium"),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 0),
        child: ElevatedButton(
          onPressed: () async {
            final cameras = await availableCameras();
            final firstCamera = cameras[1];

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => VideoRecorder(
                          camera: firstCamera,
                        )));
          },
          child: Text(
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
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text("* The results might take few minutes to show."),
      )
    ],
  ));
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
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                              height: 200,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                              height: 200,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
