import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:raabta_fyp/User/appointment_booking.dart';
import 'package:raabta_fyp/User/user_chat_screen.dart';
import 'package:raabta_fyp/User/user_chat_test.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:raabta_fyp/Models/user/user_appointments.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
import 'package:uuid/uuid.dart';

import '../Models/Chats/ChatRoom.dart';
import '../helper/Dialogs.dart';

class CounsellorsList extends StatefulWidget {
  const CounsellorsList({Key? key}) : super(key: key);

  @override
  State<CounsellorsList> createState() => _CounsellorsListState();
}

class _CounsellorsListState extends State<CounsellorsList> {
  Future<void>chatSession(String chatRoomId, String counsellorId,String counsellorName, String counsellorImageUrl)async{
    context.read<UserProvider>().getChatRoom(context.read<UserProvider>().user.id.toString()+counsellorId);

    Future.delayed(const Duration(seconds: 1),(){
      ChatRoom? chatroom =  context.read<UserProvider>().chatRoom;
      print(chatroom.toString());
      if(chatroom == null)
      {
        //new edit
        // Dialogs.showProgressBar(context);
        context.read<UserProvider>().createChatSession(new ChatRoom(id: context.read<UserProvider>().user.id.toString() + counsellorId, userId: context.read<UserProvider>().user.id.toString(), counsellorId: counsellorId, userName: context.read<UserProvider>().user.fullName, userImage: context.read<UserProvider>().user.photoUrl, counsellorName: counsellorName, counsellorImage: counsellorImageUrl));
        context.read<UserProvider>().getChatRoom(context.read<UserProvider>().user.id.toString()+counsellorId);
        Dialogs.showProgressBar(context);
        Future.delayed(const Duration(seconds: 1),(){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenUser(chatSessionId: context.read<UserProvider>().user.id.toString()+counsellorId,counsellorId: counsellorId,counsellorName: counsellorName, counsellorImage: counsellorImageUrl,)));
          print("new chat");
        });
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenUser(chatSessionId: context.read<UserProvider>().user.id.toString()+counsellorId,counsellorId: counsellorId,counsellorName: counsellorName, counsellorImage: counsellorImageUrl,)));
        // print("new chat");
      }
      else {
        print("old chat");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreenUser(chatSessionId: context.read<UserProvider>().user.id.toString()+counsellorId,counsellorId: counsellorId,counsellorName: counsellorName, counsellorImage: counsellorImageUrl,)));
      }

    });
  }

  Future<void> createAppointment(Counsellor c) async {
    var uuid = const Uuid();
    String appointmentId = uuid.v4();

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
            userId: context.read<UserProvider>().user.id,
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
    final counsellorsList = context.watch<UserProvider>().counsellors;
    print(counsellorsList);
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
          child: context.watch<UserProvider>().isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25, bottom: 8, right: 20, left: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFFF6BD12), width: 2))),
                        child: const Text(
                          "Counsellors",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: "MontserratMedium",
                            //fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: counsellorsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 4.0, right: 18, left: 18),
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.black,
                                child: ListTile(
                                  leading: Image.network(
                                      counsellorsList[index].photoUrl!),
                                  title: Row(
                                    children: [
                                      Text(
                                        "Dr. ${counsellorsList[index].displayName!.split(' ')[0]}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: "MontserratMedium",
                                        ),
                                      ),
                                      //),
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: FaIcon(
                                                FontAwesomeIcons.bullseye,
                                                color: Color(0xff006A6A),
                                                size: 15,
                                              ),
                                            ),
                                            Text(
                                              counsellorsList[index]
                                                  .specialisation!,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 12.0,
                                                bottom: 12.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AppointmentBooking(object: counsellorsList[index])));
                                                // await createAppointment(
                                                    //           counsellorsList[index]);
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.solidCalendar,
                                                color: Color(0xff006A6A),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.0,
                                                right: 10.0,
                                                top: 12.0,
                                                bottom: 12.0),
                                            child: InkWell(
                                              onTap: () {

                                                chatSession(context.read<UserProvider>().user.id.toString()+counsellorsList[index].id.toString(), counsellorsList[index].id.toString(), "Dr. "+counsellorsList[index].displayName!.split(' ')[0], counsellorsList[index].photoUrl.toString());
                                                // Future.delayed(Duration(seconds: 1),(){
                                                //   Navigator.pop(context);
                                                //   chatSession(context.read<UserProvider>().user.id.toString()+counsellorsList[index].id.toString(), counsellorsList[index].id.toString(), "Dr. "+counsellorsList[index].displayName!.split(' ')[0], counsellorsList[index].photoUrl.toString());
                                                //   // Navigator.push(context,MaterialPageRoute(builder:(context)=>NavBarUser()));
                                                // });
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             const AppointmentBooking()));
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.solidComment,
                                                color: Color(0xff006A6A),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
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
