// import 'package:flutter/material.dart';
// import 'package:raabta_fyp/Counsellor/patient_counsellor.dart';
// import 'package:provider/provider.dart';
// import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
// import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
//
//
//
// class HomeCounsellor extends StatefulWidget {
//   const HomeCounsellor({Key? key}) : super(key: key);
//
//   @override
//   State<HomeCounsellor> createState() => _HomeCounsellorState();
//
// }
//
// class _HomeCounsellorState extends State<HomeCounsellor> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     //forEach ka bhand hai
//     context.read<CounsellorProvider>().getConfirmedAppointments();
//     List<Appointments> confirmedAppointments =context.read<CounsellorProvider>().confirmedAppointments;
//     return SafeArea(
//         child: Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("assets/images/Background.jpeg"),
//                   fit: BoxFit.cover)),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 25, bottom: 15, right: 20, left: 20),
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//                         color: Color(0xFFF6BD12),
//                         width: 2
//                     )
//                 )
//             ),
//             child: Text(
//               "My Clients",
//               style: TextStyle(
//                 fontSize: 40,
//                 fontFamily: "MontserratMedium",
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//               ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.only(top: 8, bottom: 8.0),
//                   child: InkWell(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 200,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: ClampingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: confirmedAppointments.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Column(
//                             children: [
//                               Card(
//                                 elevation: 18.0,
//                                 shape: RoundedRectangleBorder(
//                                     side: const BorderSide(
//                                         color: Color(0xFF006A6A), width: 1.0),
//                                     borderRadius: BorderRadius.circular(15)),
//                                 clipBehavior: Clip.antiAlias,
//                                 margin: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 15, right: 20, left: 20),
//                                       child: CircleAvatar(
//                                         backgroundColor: Color(0xFFffffff),
//                                         radius: 45,
//                                         child: Image.network(
//                                           confirmedAppointments[index].photoUrl!,
//                                           fit: BoxFit.cover,
//                                           height: 100.0,
//                                           width: 100.0,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 10,
//                                           bottom: 20,
//                                           right: 18,
//                                           left: 18),
//                                       child: Text(
//                                         confirmedAppointments[index].patientName!,
//                                         // listData.data[position].title,
//                                         style: TextStyle(
//                                           fontSize: 24.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     onTap: (){
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => PatientCounsellor()));
//                     },
//                   ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 15, bottom: 15, right: 10, left: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Color(0xFFF6BD12),
//                         width: 2
//                       )
//                     )
//                   ),
//                   child: Text(
//                     "My Appointments",
//                     style: TextStyle(
//                         fontSize: 36,
//                         fontFamily: "MontserratMedium",
//                         fontWeight: FontWeight.w500,
//                        ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   itemCount: confirmedAppointments.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Column(
//                       children: [
//                         Card(
//                           elevation: 18.0,
//                           shape: RoundedRectangleBorder(
//                               side: const BorderSide(
//                                   color: Color(0xFF006A6A), width: 1.0),
//                               borderRadius: BorderRadius.circular(15)),
//                           clipBehavior: Clip.antiAlias,
//                           margin: const EdgeInsets.all(12.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 12, bottom: 12, right: 10, left: 8),
//                                 child: CircleAvatar(
//                                   backgroundColor: Color(0xFFffffff),
//                                   radius: 40,
//                                   child: Image.network(
//                                     confirmedAppointments[index].photoUrl!,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 3, bottom: 4),
//                                         child: Text(
//                                           confirmedAppointments[index].patientName!,
//                                           // listData.data[position].title,
//                                           style: TextStyle(
//                                             fontSize: 22.0,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.calendar_month_sharp,
//                                             color: Color(0xFF006A6A),
//                                           ),
//                                           Padding(
//                                             padding:
//                                                 const EdgeInsets.only(left: 4),
//                                             child: Text(
//                                               confirmedAppointments[index].appointmentDate!,
//                                               // listData.data[position].title,
//                                               style: TextStyle(
//                                                 fontSize: 18.0,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             top: 3, bottom: 5),
//                                         child: Row(
//                                           children: [
//                                             Icon(Icons.access_time_filled,
//                                                 color: Color(0xFF006A6A)),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 4),
//                                               child: Text(
//                                                 confirmedAppointments[index].appointmentTime!,
//                                                 // listData.data[position].title,
//                                                 style: TextStyle(
//                                                   fontSize: 18.0,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       // Padding(
//                                       //   padding: const EdgeInsets.only(
//                                       //       top: 30, left: 30),
//                                       //   child: Column(
//                                       //     mainAxisAlignment: MainAxisAlignment.end,
//                                       //     crossAxisAlignment:
//                                       //     CrossAxisAlignment.start,
//                                       //     children: [
//                                       //       Text(
//                                       //         "Status:",
//                                       //         style: TextStyle(
//                                       //           fontSize: 18.0,
//                                       //           fontWeight: FontWeight.w500,
//                                       //         ),
//                                       //       ),
//                                       //       Text(
//                                       //         confirmedAppointments[index].status,
//                                       //         style: TextStyle(
//                                       //             fontSize: 18.0,
//                                       //             fontWeight: FontWeight.w500,
//                                       //             color: Colors.green),
//                                       //       )
//                                       //     ],
//                                       //   ),
//                                       // )
//                                     ],
//                                   ),
//
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
//
//
//
//
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/patient_counsellor.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:raabta_fyp/helper/Dialogs.dart';



class HomeCounsellor extends StatefulWidget {
  const HomeCounsellor({Key? key}) : super(key: key);

  @override
  State<HomeCounsellor> createState() => _HomeCounsellorState();

}

class _HomeCounsellorState extends State<HomeCounsellor> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CounsellorProvider>().getConfirmedAppointments();
  }

  @override
  Widget build(BuildContext context) {
    List<Appointments> confirmedAppointments = context.read<CounsellorProvider>().confirmedAppointments;
    List<UserModel> clients = context.read<CounsellorProvider>().Clients ;
    return SafeArea(
        child: context.watch<CounsellorProvider>().isLoading ? Center(child: CircularProgressIndicator()) : Scaffold(
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
                        "My Clients",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "MontserratMedium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                    child: clients.isNotEmpty ? InkWell(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: clients.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InkWell(
                                    child: Card(
                                      elevation: 8.0,
                                      shape: RoundedRectangleBorder(
                                          // side: const BorderSide(
                                          //     color: Color(0xFF006A6A), width: 1.0),
                                          borderRadius: BorderRadius.circular(15)),
                                      clipBehavior: Clip.antiAlias,
                                      margin: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, right: 20, left: 20),
                                            child: CircleAvatar(
                                              backgroundColor: Color(0xFFffffff),
                                              radius: 45,
                                              child: Image.network(
                                                clients[index].photoUrl.toString(),
                                                fit: BoxFit.cover,
                                                height: 100.0,
                                                width: 100.0,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                bottom: 20,
                                                right: 18,
                                                left: 18),
                                            child: Text(
                                              "Mr. "+clients[index].fullName.toString().split(" ")[0],
                                              // listData.data[position].title,
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),


                                    ),
                                    onTap: (){
                                      context.read<CounsellorProvider>().getEmotionDetectionResults(clients[index].id.toString());
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => PatientCounsellor(user: clients[index])));
                                    }
                                ),
                              ],
                            );

                          },
                        ),
                      ),
                    ) : Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 75),
                      child: Center(child: Text("No clients to show.", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blueGrey),)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, bottom: 15, right: 10, left: 10),
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
                        "My Appointments",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "MontserratMedium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  confirmedAppointments.isNotEmpty? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: confirmedAppointments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Card(
                              elevation: 8.0,
                              shape: RoundedRectangleBorder(
                                  // side: const BorderSide(
                                  //     color: Color(0xFF006A6A), width: 1.0),
                                  borderRadius: BorderRadius.circular(15)),
                              clipBehavior: Clip.antiAlias,
                              margin: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12, right: 10, left: 8),
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFffffff),
                                      radius: 40,
                                      child: Image.network(
                                        confirmedAppointments[index].photoUrl!,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, bottom: 4),
                                            child: Text(
                                              confirmedAppointments[index].patientName!,
                                              // listData.data[position].title,
                                              style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month_sharp,
                                                color: Color(0xFF006A6A),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 4),
                                                child: Text(
                                                  confirmedAppointments[index].appointmentDate!,
                                                  // listData.data[position].title,
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, bottom: 5),
                                            child: Row(
                                              children: [
                                                Icon(Icons.access_time_filled,
                                                    color: Color(0xFF006A6A)),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4),
                                                  child: Text(
                                                    confirmedAppointments[index].appointmentTime!,
                                                    // listData.data[position].title,
                                                    style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Padding(
                                          //   padding: const EdgeInsets.only(
                                          //       top: 30, left: 30),
                                          //   child: Column(
                                          //     mainAxisAlignment: MainAxisAlignment.end,
                                          //     crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          //     children: [
                                          //       Text(
                                          //         "Status:",
                                          //         style: TextStyle(
                                          //           fontSize: 18.0,
                                          //           fontWeight: FontWeight.w500,
                                          //         ),
                                          //       ),
                                          //       Text(
                                          //         confirmedAppointments[index].status,
                                          //         style: TextStyle(
                                          //             fontSize: 18.0,
                                          //             fontWeight: FontWeight.w500,
                                          //             color: Colors.green),
                                          //       )
                                          //     ],
                                          //   ),
                                          // )
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ) : Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(child: Text("No appointments to show.", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blueGrey),)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}