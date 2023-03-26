import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/user/user_appointments.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
class UserAppointmentsScreen extends StatefulWidget {
  const UserAppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<UserAppointmentsScreen> createState() => _UserAppointmentsState();
}

class _UserAppointmentsState extends State<UserAppointmentsScreen> {

  @override
  Widget build(BuildContext context) {
    context.watch<UserProvider>().getAppointments();
    List<UserAppointments>? appointments = context.read<UserProvider>().user.appointments;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 35, bottom: 35, right: 20, left: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "My Appointments",
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "MontserratMedium",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: appointments!.length,
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
                                  backgroundColor: const Color(0xFFffffff),
                                  radius: 40,
                                  child: Image.network(
                                    appointments[index].photoUrl!,
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
                                          appointments[index].counsellorName.toString(),
                                          // listData.data[position].title,
                                          style: const TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month_sharp,
                                            color: Color(0xFF006A6A),
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 4),
                                            child: Text(
                                              appointments[index].appointmentDate!,
                                              // listData.data[position].title,
                                              style: const TextStyle(
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
                                            const Icon(Icons.access_time_filled,
                                                color: Color(0xFF006A6A)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4),
                                              child: Text(
                                                appointments[index].appointmentTime!,
                                                // listData.data[position].title,
                                                style: const TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Status:",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          appointments[index].status,
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.green),
                                        )
                                      ],
                                    ),
                                  )
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
    );
  }
}

