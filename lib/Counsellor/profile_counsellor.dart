import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';
import 'package:raabta_fyp/User/navbar_user.dart';
import 'package:raabta_fyp/User/viewprofile_user.dart';
import 'package:provider/provider.dart';

import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'navbar_counsellor.dart';

class ProfileCounsellor extends StatefulWidget {
  const ProfileCounsellor({Key? key}) : super(key: key);

  @override
  State<ProfileCounsellor> createState() => _ProfileCounsellorState();
}
//Test Comment
//Subhan
class _ProfileCounsellorState extends State<ProfileCounsellor> {
  SingleValueDropDownController gender = SingleValueDropDownController();
  SingleValueDropDownController specialisation = SingleValueDropDownController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController name = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = context.read<CounsellorProvider>().counsellor.displayName!;

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          //resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Background.jpeg"),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
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
                        "Profile Completeness",
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: "MontserratMedium",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Full Name",
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
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: TextField(
                      controller: dOBController,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
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
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                          //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dOBController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: DropDownTextField(
                      //initialValue: "name4",
                      controller: gender,
                      clearOption: true,
                      textFieldDecoration: InputDecoration(
                          labelText: "Gender",
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

                          hintText: "Select your gender"),

                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 3,

                      dropDownList: const [
                        DropDownValueModel(name: 'Male', value: "value1"),
                        DropDownValueModel(
                          name: 'Female',
                          value: "value2",
                        ),
                        DropDownValueModel(name: 'Others', value: "value3"),
                      ],
                      //onChanged: (val) {},
                    ),
                  ),
                  // Recommendation Tag
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: DropDownTextField(
                      //initialValue: "name4",
                      controller: specialisation,
                      clearOption: true,
                      textFieldDecoration: InputDecoration(
                          labelText: "Specialization?",
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

                          hintText: "Specialization?"),

                      validator: (value) {
                        if (value == null) {
                          return "Required field";
                        } else {
                          return null;
                        }
                      },
                      dropDownItemCount: 6,

                      dropDownList: const [
                        DropDownValueModel(
                            name: 'Anxiety', value: "value1"),
                        DropDownValueModel(
                          name: 'Career/ Academic',
                          value: "value2",
                        ),
                        DropDownValueModel(name: 'Profession', value: "value3"),
                      ],
                      //onChanged: (val) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: ElevatedButton(
                      onPressed: () async{
                        await context.read<CounsellorProvider>().profileComplete(dOBController.text, gender.dropDownValue!.name, specialisation.dropDownValue!.name);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NavBarCounsellor()));
                      },
                      child: Text(
                        "NEXT ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006A6A)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffFFFFFF),
                        minimumSize: Size(300, 50),
                        side: BorderSide(width: 1, color: Color(0xff006A6A)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
