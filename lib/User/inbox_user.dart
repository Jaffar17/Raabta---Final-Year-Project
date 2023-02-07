import 'package:flutter/material.dart';

class InboxUser extends StatefulWidget {
  const InboxUser({Key? key}) : super(key: key);

  @override
  State<InboxUser> createState() => _InboxUserState();
}

class _InboxUserState extends State<InboxUser> {
  List<TestData> tdList = [
    TestData(name: "Patient 1", message: "Hello there!"),
    TestData(name: "Patient 1", message: "Hello there!"),
    TestData(name: "Patient 1", message: "Hello there!"),
  ];

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
                  image: AssetImage("assets/images/Background.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 140, left: 140),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  alignment: Alignment.center,
                  child: const Text(
                    "Inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "MontserratMedium",
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestData {
  String name;
  String message;

  TestData({required this.name, required this.message});
}
