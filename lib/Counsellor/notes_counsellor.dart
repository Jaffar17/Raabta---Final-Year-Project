// import 'package:flutter/material.dart';
// import 'package:raabta_fyp/Counsellor/viewnote_counsellor.dart';
//
// import '../Models/counsellor/counsellor_notes_model.dart';
// import '../controllers/counsellor/counsellor_provider.dart';
// import 'newnote_counsellor.dart';
// import 'package:provider/provider.dart';
//
// class NotesCounsellor extends StatefulWidget {
//   const NotesCounsellor({Key? key}) : super(key: key);
//
//   @override
//   State<NotesCounsellor> createState() => _NotesCounsellorState();
// }
//
// class _NotesCounsellorState extends State<NotesCounsellor> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     List<Notes> tdList = context.watch<CounsellorProvider>().counsellor.notes!;
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/Background.jpeg"),
//                   fit: BoxFit.cover)),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             //mainAxisAlignment: MainAxisAlignment.center,
//             //crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                     border: Border(
//                         bottom:
//                         BorderSide(color: Color(0xFFF6BD12), width: 2))),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 12.0),
//                   child: const Text(
//                     "My Notes",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontFamily: "MontserratMedium",
//                       //fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: tdList.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(
//                           top: 8.0, bottom: 4.0, right: 18, left: 18),
//                       child: InkWell(
//                         child: Card(
//                           elevation: 14,
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(color: Colors.black12),
//                               borderRadius: BorderRadius.circular(10)),
//                           shadowColor: Colors.black,
//                           child: ListTile(
//                             // shape: RoundedRectangleBorder(
//                             //   side: const BorderSide(
//                             //       //width: 2,
//                             //    //   color: Colors.amberAccent
//                             //   ),
//                             //   borderRadius: BorderRadius.circular(10),
//                             // ),
//                             leading: Image.asset("assets/images/ProfilePic.png"),
//                             title: Text(
//                               tdList[index].patientName.toString(),
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontFamily: "MontserratMedium",
//                               ),
//                             ),
//                             subtitle: Text(
//                                 tdList[index].note.toString()),
//                             trailing: Padding(
//                               padding: const EdgeInsets.only(bottom: 25),
//                               child: Text(tdList[index].Date.toString(), style: TextStyle(fontSize: 14),),
//                             ),
//                           ),
//
//                         ),
//                         onTap: (){
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => ViewNotesCounsellor()));
//                         },
//                       ),
//                     );
//                   }),
//               Padding(
//                 padding: const EdgeInsets.only(top: 130, bottom: 15, right: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(child: Icon(Icons.add_circle, color: Color(0xFF006A6A), size: 50,), onTap: (){
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => NewNoteCounsellor()));
//                     },),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/viewnote_counsellor.dart';

import '../Models/counsellor/counsellor_notes_model.dart';
import '../controllers/counsellor/counsellor_provider.dart';
import 'newnote_counsellor.dart';
import 'package:provider/provider.dart';

class NotesCounsellor extends StatefulWidget {
  const NotesCounsellor({Key? key}) : super(key: key);

  @override
  State<NotesCounsellor> createState() => _NotesCounsellorState();
}

class _NotesCounsellorState extends State<NotesCounsellor> {



  @override
  Widget build(BuildContext context) {
    List<Notes> tdList = context.watch<CounsellorProvider>().counsellor.notes!;
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
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                        BorderSide(color: Color(0xFFF6BD12), width: 2))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0),
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
                              tdList[index].patientName.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                            subtitle: Text(
                                tdList[index].note.toString()),
                            trailing: Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Text(tdList[index].Date.toString(), style: TextStyle(fontSize: 14),),
                            ),
                          ),

                        ),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ViewNotesCounsellor(note_id: index)));
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