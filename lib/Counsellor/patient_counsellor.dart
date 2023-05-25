// import 'package:flutter/material.dart';
//
// class PatientCounsellor extends StatefulWidget {
//   const PatientCounsellor({Key? key}) : super(key: key);
//
//   @override
//   State<PatientCounsellor> createState() => _PatientCounsellorState();
// }
//
// class _PatientCounsellorState extends State<PatientCounsellor> {
//   List<AppointmentDetails> details = [
//     AppointmentDetails(date: "12 Nov 2023", time: "09:00 PM"),
//     AppointmentDetails(date: "19 Nov 2023", time: "09:00 PM")
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/Background.jpeg"),
//                     fit: BoxFit.cover)),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 35, bottom: 35, right: 20, left: 20),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: Color(0xFFF6BD12), width: 2))),
//                     child: Text(
//                       "Patient 1",
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontFamily: "MontserratMedium",
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 16.0, right: 16.0, bottom: 10.0),
//                   child: Image.asset(
//                     "assets/images/ProfilePic.png",
//                     // width: 150,
//                     // height: 180,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       top: 35, bottom: 35, right: 20, left: 20),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         border: Border(
//                             bottom: BorderSide(
//                                 color: Color(0xFFF6BD12), width: 2))),
//                     child: Text(
//                       "Appointments",
//                       style: TextStyle(
//                         fontSize: 36,
//                         fontFamily: "MontserratMedium",
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     physics: ClampingScrollPhysics(),
//                     scrollDirection: Axis.vertical,
//                     itemCount: details.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return Column(
//                         children: [
//                           Card(
//                             elevation: 18.0,
//                             shape: RoundedRectangleBorder(
//                                 side: const BorderSide(
//                                     color: Color(0xFF006A6A), width: 1.0),
//                                 borderRadius: BorderRadius.circular(15)),
//                             clipBehavior: Clip.antiAlias,
//                             margin: const EdgeInsets.all(12.0),
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 12, bottom: 12),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 15),
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.calendar_month_sharp,
//                                           color: Color(0xFF006A6A),
//                                         ),
//                                         Padding(
//                                           padding:
//                                           const EdgeInsets.only(left: 4),
//                                           child: Text(
//                                             details[index].date,
//                                             // listData.data[position].title,
//                                             style: TextStyle(
//                                               fontSize: 18.0,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.access_time_filled,
//                                           color: Color(0xFF006A6A)),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 4),
//                                         child: Text(
//                                           details[index].time,
//                                           // listData.data[position].title,
//                                           style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15),
//                                     child: Icon(Icons.check_circle,
//                                         color: Color(0xFF006A6A)),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class AppointmentDetails {
//   String date;
//   String time;
//
//   AppointmentDetails({required this.date, required this.time});
// }
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/userreport_counsellor.dart';

import '../Models/user/user_model.dart';

class PatientCounsellor extends StatefulWidget {
  UserModel user;
  PatientCounsellor({Key? key, required this.user}) : super(key: key);

  @override
  State<PatientCounsellor> createState() => _PatientCounsellorState();
}

class _PatientCounsellorState extends State<PatientCounsellor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Background.jpeg"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 15, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFF6BD12),
                                width: 2
                            )
                        )
                    ),
                    child: Text(
                      "Client History",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "MontserratMedium",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( top: 35,
                      left: 16.0, right: 16.0),
                  child: Image.network(
                    widget.user.photoUrl.toString(),
                    // width: 150,
                    // height: 180,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 25, right: 20, left: 20),
                  child: Text(
                    widget.user.fullName.toString(),
                    style: TextStyle(
                      fontSize: 24,
                      // fontFamily: "MontserratMedium",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> UserReportCounsellor(user:widget.user)));
                  },
                  child: Text(
                    "VIEW USER REPORT",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "MontserratMedium",
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff006A6A),
                    minimumSize: Size(300, 50),
                    side: BorderSide(
                        width: 1, color: Color(0xff006A6A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 25, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFF6BD12), width: 2))),
                    child: Text(
                      "Appointments",
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: "MontserratMedium",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: widget.user.appointments!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 8.0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF006A6A), width: 1.0),
                                borderRadius: BorderRadius.circular(15)),
                            clipBehavior: Clip.antiAlias,
                            margin: const EdgeInsets.all(12.0),
                            child: widget.user.appointments![index].status == "Confirmed"? Padding(
                              padding: const EdgeInsets.only(top: 12, bottom: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month_sharp,
                                          color: Color(0xFF006A6A),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(left: 4),
                                          child: Text(
                                            widget.user.appointments![index].appointmentDate.toString(),
                                            // listData.data[position].title,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time_filled,
                                          color: Color(0xFF006A6A)),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4),
                                        child: Text(
                                          widget.user.appointments![index].appointmentTime.toString(),
                                          // listData.data[position].title,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Icon(Icons.check_circle,
                                        color: Color(0xFF006A6A)),
                                  ),
                                ],
                              ),
                            ): null,
                          ),

                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}