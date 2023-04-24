import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/user/user_appointments.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
import 'package:uuid/uuid.dart';


class CounsellorsList extends StatefulWidget {
  const CounsellorsList({Key? key}) : super(key: key);

  @override
  State<CounsellorsList> createState() => _CounsellorsListState();
}

class _CounsellorsListState extends State<CounsellorsList> {

  Future<void> createAppointment(Counsellor c) async {
    var uuid = Uuid();
    String appointmentId= uuid.v4();

    await context.read<UserProvider>().createAppointment(UserAppointments(
        id: appointmentId,
        counsellorName: c.displayName,
        photoUrl: c.photoUrl,
        appointmentDate: "newDate",
        appointmentTime: "new time"));

    await context.read<UserProvider>().setAppointment(
        c,
        Appointments(
            id: appointmentId,
            patientName: context.read<UserProvider>().user.fullName,
            photoUrl: context.read<UserProvider>().user.photoUrl,
            userId: context.read<UserProvider>().user.id ,
            appointmentDate: "newDate",
            appointmentTime: "new time"));
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().getCounsellors();
  }

  @override
  Widget build(BuildContext context) {
    final counsellorsList =  context.watch<UserProvider>().counsellors;
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
          child: context.watch<UserProvider>().isLoading?Center(child:CircularProgressIndicator()):Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 36, bottom: 8, right: 20, left: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "Counsellors",
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
                  itemCount: counsellorsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 4.0, right: 18, left: 18),
                      child: Card(
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

                          leading:
                              Image.network(counsellorsList[index].photoUrl!),
                          title: //Padding(
                              //padding: const EdgeInsets.only(top: 10.0),
                              // child:
                              Row(
                            children: [
                              //Padding(
                              //padding: const EdgeInsets.all(4.0),
                              //child:
                              Text(
                                counsellorsList[index].displayName!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: "MontserratMedium",
                                ),
                              ),
                              //),
                              Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 100.0, top: 18, bottom: 8),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidCalendar,
                                      color: Color(0xff006A6A),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 100.0),
                                  //   child: FaIcon(FontAwesomeIcons.solidComment, color: Color(0xff006A6A),),
                                  // ),
                                ],
                              )
                            ],
                          ),
                          // ),

                          subtitle: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.graduationCap,
                                        color: Color(0xff006A6A),
                                        size: 15,
                                      ),
                                    ),
                                    Text(
                                      counsellorsList[index].specialisation!,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    // const Padding(
                                    //   padding:
                                    //       EdgeInsets.only(left: 120.0),
                                    //   child: FaIcon(
                                    //     FontAwesomeIcons.solidComment,
                                    //     color: Color(0xff006A6A),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: Row(
                              //     children: [
                              //       const Padding(
                              //         padding:
                              //             EdgeInsets.only(right: 8.0),
                              //         child: FaIcon(
                              //           FontAwesomeIcons.bullseye,
                              //           color: Color(0xff006A6A),
                              //           size: 15,
                              //         ),
                              //       ),
                              //       Text(
                              //         counsellorsList[index].specialization,
                              //         style: const TextStyle(fontSize: 12),
                              //       ),
                              //       const Padding(
                              //         padding:
                              //         EdgeInsets.only(left: 117.0),
                              //         child: FaIcon(
                              //           FontAwesomeIcons.solidComment,
                              //           color: Color(0xff006A6A),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              ElevatedButton(
                                  onPressed: () async {
                                    await createAppointment(
                                        counsellorsList[index]);
                                  },
                                  child: Icon(Icons.add)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class TestDataCounsellors {
  String name;
  String qualification;
  String specialization;

  TestDataCounsellors(
      {required this.name,
      required this.qualification,
      required this.specialization});
}
