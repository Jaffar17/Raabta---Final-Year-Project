import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../Models/counsellor/counsellor_appointments.dart';
import '../Models/user/user_appointments.dart';
import '../controllers/user/user_provider.dart';

class AppointmentBooking extends StatefulWidget {
  Counsellor object;
  AppointmentBooking({Key? key, required this.object}) : super(key: key);

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  Future<void> createAppointment(Counsellor c, String date, String time) async {
    print(c.toString());
    var uuid = const Uuid();
    String appointmentId = uuid.v4();

    await context.read<UserProvider>().createAppointment(UserAppointments(
        id: appointmentId,
        counsellorName: c.displayName,
        photoUrl: c.photoUrl,
        appointmentDate: date,
        appointmentTime: time));

    await context.read<UserProvider>().setAppointment(
        c,
        Appointments(
            id: appointmentId,
            patientName: context.read<UserProvider>().user.fullName,
            photoUrl: context.read<UserProvider>().user.photoUrl,
            userId: context.read<UserProvider>().user.id,
            appointmentDate: date,
            appointmentTime: time));
  }

  TextEditingController dateController = TextEditingController();
  SingleValueDropDownController timeSlot = SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: ,
            body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.jpeg"),
              fit: BoxFit.cover)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 36, bottom: 24, right: 20, left: 20),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xFFF6BD12), width: 2))),
              child: const Text(
                "Choose Your Slot",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: "MontserratMedium",
                  //fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: Image.asset(
              "assets/images/ProfilePic.png",
              width: 150,
              height: 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Dr. Test",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "MontserratMedium",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            "Choose your Date and Time",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "MontserratMedium",
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 16.0, right: 16.0, bottom: 20.0),
            child: TextField(
              controller: dateController,
              //editing controller of this TextField
              decoration: InputDecoration(
                labelText: "Appointment Date",
                labelStyle: TextStyle(color: Color(0xff006A6A)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff006A6A)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff006A6A)),
                ),
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(pickedDate);
                  //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateController.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: DropDownTextField(
              controller: timeSlot,
              clearOption: true,
              textFieldDecoration: InputDecoration(
                  labelText: "Time Slot",
                  labelStyle: TextStyle(color: Color(0xff006A6A)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff006A6A)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Color(0xff006A6A)),
                  ),
                  // enableSearch: true,
                  // dropdownColor: Colors.green,
                  //searchDecoration:

                  hintText: "Which time slot are you looking for?"),
              validator: (value) {
                if (value == null) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 3,
              dropDownList: const [
                DropDownValueModel(
                    name: '6:30 PM - 7:30 PM', value: "6:30 PM - 7:30 PM"),
                DropDownValueModel(
                  name: '7:30 PM - 8:30 PM',
                  value: "7:30 PM - 8:30 PM",
                ),
                DropDownValueModel(
                    name: '8:30 PM - 9:30 PM', value: "8:30 PM - 9:30 PM"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const NavBarUser()));
                print("Date: "+dateController.text);
                print("Time: "+timeSlot.dropDownValue!.value.toString());
                createAppointment(widget.object, dateController.text, timeSlot.dropDownValue!.value.toString());

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 200,
                          // width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12.0),
                                  child: Text(
                                    'Your appointment request has been generated. Keep checking the status.'),
                                ),

                                SizedBox(
                                  width: 320.0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12, right: 12),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context); // We need to route back to counsellors screen, as of now not happening
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff006A6A),
                                        minimumSize: const Size(100, 30),
                                        side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                      ),
                                    ),
                                  ),
                                    // color: const Color(0xFF1BC0C5),
                                  ),

                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: const Text(
                "CONFIRM",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff006A6A),
                minimumSize: const Size(300, 50),
                side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
