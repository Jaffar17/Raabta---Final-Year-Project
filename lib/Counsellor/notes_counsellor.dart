import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/viewnote_counsellor.dart';

import 'newnote_counsellor.dart';

class NotesCounsellor extends StatefulWidget {
  const NotesCounsellor({Key? key}) : super(key: key);

  @override
  State<NotesCounsellor> createState() => _NotesCounsellorState();
}

class _NotesCounsellorState extends State<NotesCounsellor> {

  List<TestDataNotes> tdList = [
    TestDataNotes(name: "Patient 1", message: "Improvement can be seen.", date: "2 Jan 2023"),
    TestDataNotes(name: "Patient 2", message: "Treatment changed.", date: "31 Jan 2023"),
    TestDataNotes(name: "Patient 3", message: "Symptoms still persists.", date: "10 Feb 2023"),
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
                    top: 36, bottom: 8, right: 120, left: 120),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "My Notes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "MontserratMedium",
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: tdList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 4.0, right: 18, left: 18),
                      child: InkWell(
                        child: Card(
                          elevation: 14,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.black,
                          child: ListTile(
                            // shape: RoundedRectangleBorder(
                            //   side: const BorderSide(
                            //       //width: 2,
                            //    //   color: Colors.amberAccent
                            //   ),
                            //   borderRadius: BorderRadius.circular(10),
                            // ),
                            leading: Image.asset("assets/images/ProfilePic.png"),
                            title: Text(
                              tdList[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                            subtitle: Text(
                                "${tdList[index].message.substring(0, 12)}..."),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Text(tdList[index].date, style: TextStyle(fontSize: 14),),
                            ),
                          ),

                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ViewNotesCounsellor()));
                        },
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(child: Icon(Icons.add_circle, color: Color(0xFF006A6A), size: 50,), onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewNoteCounsellor()));
                    },),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestDataNotes {
  String name;
  String message;
  String date;

  TestDataNotes({required this.name, required this.message, required this.date});
}