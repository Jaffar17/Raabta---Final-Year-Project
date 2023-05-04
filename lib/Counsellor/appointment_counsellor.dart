import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';

import '../Models/counsellor/counsellor_appointments.dart';
import 'UpdateAppointment.dart';



class AppointmentCounsellor extends StatefulWidget {
  const AppointmentCounsellor({Key? key}) : super(key: key);

  @override
  State<AppointmentCounsellor> createState() => _AppointmentCounsellorState();
}

class _AppointmentCounsellorState extends State<AppointmentCounsellor> {



  @override
  Widget build(BuildContext context) {
    context.watch<CounsellorProvider>().getAppointments();
    List<Appointments>? appointment = context.read<CounsellorProvider>().counsellor.appointments;
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
                      top: 35, bottom: 35, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFF6BD12), width: 2))),
                    child: Text(
                      "My Appointments",
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: "MontserratMedium",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: appointment?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Card(
                            elevation: 14.0,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Color(0xFF006A6A), width: 1.0),
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
                                      appointment![index].photoUrl.toString(),
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
                                            appointment![index].patientName.toString(),
                                            // listData.data[position].title,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "MontserratMedium",
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
                                                appointment[index].appointmentDate.toString(),
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
                                                  appointment[index].appointmentTime.toString(),
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status:  ",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            appointment![index].status == "Pending"
                                                ? acceptOrReject(
                                                appointment: appointment![index])
                                                : Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    appointment![index].status,
                                                    style: TextStyle(
                                                        color: appointment![index]
                                                            .status ==
                                                            "Confirmed"
                                                            ? Color(0xff00B012)
                                                            : Colors.red,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

