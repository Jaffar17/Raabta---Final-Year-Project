import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/patient_counsellor.dart';

class HomeCounsellor extends StatefulWidget {
  const HomeCounsellor({Key? key}) : super(key: key);

  @override
  State<HomeCounsellor> createState() => _HomeCounsellorState();
}

class _HomeCounsellorState extends State<HomeCounsellor> {
  List<Users> user = [
    Users(name: "Patient 1", picture: "assets/images/ProfilePic.png"),
    Users(name: "Patient 2", picture: "assets/images/ProfilePic.png"),
    Users(name: "Patient 3", picture: "assets/images/ProfilePic.png"),
    Users(name: "Patient 4", picture: "assets/images/ProfilePic.png"),
  ];
  List<Appointments> appointment = [
    Appointments(
        name: "Test Patient 5",
        picture: "assets/images/ProfilePic.png",
        date: "01/03/2023",
        time: "09:00 pm",
        status: "Accepted"),
    Appointments(
        name: "Test Patient 6",
        picture: "assets/images/ProfilePic.png",
        date: "01/03/2023",
        time: "09:00 pm",
        status: "Accepted"),
    Appointments(
        name: "Test Patient 7",
        picture: "assets/images/ProfilePic.png",
        date: "01/03/2023",
        time: "09:00 pm",
        status: "Accepted"),
    Appointments(
        name: "Test Patient 8",
        picture: "assets/images/ProfilePic.png",
        date: "01/03/2023",
        time: "09:00 pm",
        status: "Accepted"),
  ];

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
              "My Patients",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "MontserratMedium",
                fontWeight: FontWeight.w500,
              ),
            ),
              ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                  child: InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: user.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Card(
                                elevation: 18.0,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Color(0xFF006A6A), width: 1.0),
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
                                        child: Image.asset(
                                          user[index].picture,
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
                                        user[index].name,
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
                            ],
                          );
                        },
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PatientCounsellor()));
                    },
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
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: appointment.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Card(
                          elevation: 18.0,
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
                                  child: Image.asset(
                                    appointment[index].picture,
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
                                          appointment[index].name,
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
                                              appointment[index].date,
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
                                                appointment[index].time,
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
                                        Text(
                                          "Status:",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          appointment[index].status,
                                          style: TextStyle(
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
    ));
  }
}

class Users {
  String name;
  String picture;

  Users({required this.name, required this.picture});
}

class Appointments {
  String name;
  String picture;
  String date;
  String time;
  String status;

  Appointments(
      {required this.name,
      required this.picture,
      required this.date,
      required this.time,
      required this.status});
}
