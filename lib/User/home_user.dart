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
  }

  @override
  Widget build(BuildContext context) {
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
                      context.read<UserProvider>().emotions!.isEmpty
                          ? _NotRecorded(context)
                          : _Emotion_Detection_Results(
                              context.read<UserProvider>().emotions!),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       top: 125, bottom: 15, left: 10, right: 10),
                      //   child: Text(
                      //     "Get Insights about yourself",
                      //     style:
                      //     TextStyle(fontFamily: "MontserratMedium", fontSize: 20),
                      //   ),
                      // ),
                      // Text(
                      //   "Record a 1-minute video of yourself giving \na small introduction of yourself",
                      //   style: TextStyle(fontFamily: "MontserratMedium"),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                      //   child: ElevatedButton(
                      //     onPressed: () async {
                      //       final cameras = await availableCameras();
                      //       final firstCamera = cameras[1];
                      //
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => VideoRecorder(
                      //                 camera: firstCamera,
                      //               )));
                      //     },
                      //     child: Text(
                      //       "RECORD ",
                      //       style: TextStyle(
                      //           fontSize: 22,
                      //           fontWeight: FontWeight.bold,
                      //           color: Color(0xffFFFFFF)),
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: const Color(0xff006A6A),
                      //       minimumSize: const Size(300, 50),
                      //       side:
                      //       const BorderSide(width: 1, color: Color(0xff006A6A)),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(18),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, bottom: 15, left: 10, right: 10),
                            child: Text(
                              "Personality Test Results",
                              style: TextStyle(
                                  fontFamily: "MontserratMedium", fontSize: 20),
                            ),
                          ),
                          _Evaluations(context.read<UserProvider>().user.Ptest),
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
  return PieChart(dataMap: data);
}

Widget _NotRecorded(BuildContext context) {
  return Container(
      child: Column(
    children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 0, bottom: 15, left: 10, right: 10),
        child: Text(
          "Get Insights about yourself",
          style: TextStyle(fontFamily: "MontserratMedium", fontSize: 20),
        ),
      ),
      Text(
        "Record a 1-minute video of yourself giving \na small introduction of yourself",
        style: TextStyle(fontFamily: "MontserratMedium"),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25.0, bottom: 0),
        child: ElevatedButton(
          onPressed: () async {
            final cameras = await availableCameras();
            final firstCamera = cameras[1];

            Navigator.push(
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
    ],
  ));
}

Widget _Evaluations(PersonalityTestModel? evaluation) {
  return Padding(
    padding: const EdgeInsets.only(left: 28.0, right: 28),
    child: Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Text(" Extroversion"),
            ),
            Center(
              child: TableCell(
                child: Text(evaluation!.extroversion.toString()),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(' Agreeableness'),
            ),
            Center(
              child: TableCell(
                child: Text(evaluation!.Agreeableness.toString()),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(' Conscientiousness'),
            ),
            Center(
              child: TableCell(
                child: Text(evaluation!.conscientiousness.toString()),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(' Neuroticism'),
            ),
            Center(
              child: TableCell(
                child: Text(evaluation!.neurotocism.toString()),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(' Openness to Experience'),
            ),
            Center(
              child: TableCell(
                child: Text(evaluation!.openess.toString()),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
