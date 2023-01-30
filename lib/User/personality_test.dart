import 'package:flutter/material.dart';

class PersonalityTest extends StatefulWidget {
  const PersonalityTest({Key? key}) : super(key: key);

  @override
  State<PersonalityTest> createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  double q1Value = 0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ptestBackground.png"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 7),
                    child: Image.asset(
                      "assets/images/ptest.png",
                      height: 100,
                      width: 200,
                    ),
                  ),
                  Text(
                    "Help us evaluate your Personality",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff006A6A)),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, top: 8),
                            child: Text("Q1. This is a sample question", style: TextStyle(fontSize: 18, color: Color(0xff006A6A)),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slider(value: q1Value,
                                max: 10,
                                divisions: 10,
                                activeColor: Color(0xff006A6A),
                                //inactiveColor: Color(0xff006A6A),
                                label: q1Value.round().toString(),
                                onChanged: (double value){
                              setState(() {
                                q1Value = value;
                              });
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

// Add this line to login user class for routing check
// Navigator.push(context,
//     MaterialPageRoute(builder: (context) => PersonalityTest()));