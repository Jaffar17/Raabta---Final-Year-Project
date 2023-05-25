import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:raabta_fyp/Counsellor/navbar_counsellor.dart';
import 'package:raabta_fyp/User/home_user.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:provider/provider.dart';

class EditProfileCounsellor extends StatefulWidget {
  const EditProfileCounsellor({Key? key}) : super(key: key);

  @override
  State<EditProfileCounsellor> createState() => _EditProfileCounsellorState();
}

class _EditProfileCounsellorState extends State<EditProfileCounsellor> {
  TextEditingController _cname = new TextEditingController();
  TextEditingController _cemail = new TextEditingController();
  late SingleValueDropDownController specialisation;
  bool emailCheck = true;
  bool nameCheck = true;

  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _cname.text = context.read<CounsellorProvider>().counsellor.displayName!;
    _cemail.text = context.read<CounsellorProvider>().counsellor.email!;
  }

  @override
  Widget build(BuildContext context) {
    emailCheck = true;
    nameCheck = true;
    SingleValueDropDownController specialisation =
    new SingleValueDropDownController(data: new DropDownValueModel(name: context.read<CounsellorProvider>().counsellor.specialisation.toString(), value: context.read<CounsellorProvider>().counsellor.specialisation.toString()));

    if (_cname.text == ""){
      nameCheck = false;
    }
    if (_cemail.text == ""){
      emailCheck = false;
    }

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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 35, right: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "MontserratMedium",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 10.0),
                child: Image.network(
                  context.read<CounsellorProvider>().counsellor.photoUrl!,
                  // width: 150,
                  // height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 20.0),
                child: TextField(
                  controller: _cname,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    errorText: nameCheck? null: "Name is empty!",
                    labelStyle: TextStyle(color: Color(0xff006A6A)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
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
                  controller: _cemail,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorText: emailCheck? null: "Email is empty!",
                    labelStyle: TextStyle(color: Color(0xff006A6A)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xff006A6A)),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16.0, right: 16.0, bottom: 20.0),
              //   child: TextField(
              //     controller: _cpassword,
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       labelText: "Password",
              //       labelStyle: TextStyle(color: Color(0xff006A6A)),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(color: Color(0xff006A6A)),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(12),
              //         borderSide: BorderSide(color: Color(0xff006A6A)),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 20.0),
                child: DropDownTextField(
                  // initialValue: "name4",
                  controller: specialisation,
                  clearOption: true,
                  textFieldDecoration: InputDecoration(
                      labelText: "Specialization",
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

                      hintText: "Specialization"),

                  validator: (value) {
                    if (value == null) {
                      return "Required field";
                    } else {
                      return null;
                    }
                  },
                  dropDownItemCount: 6,

                  dropDownList: const [
                    DropDownValueModel(name: 'Anxiety Issues', value: "Anxiety Issues"),
                    DropDownValueModel(
                      name: 'Career/ Academic Issues',
                      value: "Career/ Academic Issues",
                    ),
                    DropDownValueModel(name: 'Professional Issues', value: "Professional Issues"),
                  ],
                  //onChanged: (val) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      if (_cname.text == ""){
                        nameCheck = false;
                      }
                      if (_cemail.text == ""){
                        emailCheck = false;
                      }
                    });
                    await context.read<CounsellorProvider>().editProfile(
                        _cname.text,
                        _cemail.text,
                        specialisation.dropDownValue!.value.toString());
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
                                    Center(
                                      child: Text(
                                          'Your profile has been updated.', style: TextStyle(fontSize: 16),),
                                    ),

                                    SizedBox(
                                      width: 320.0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Navigator.of(context, rootNavigator: true).pop();
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBarCounsellor())); // We need to route back to counsellors screen, as of now not happening
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xff006A6A),
                                            minimumSize: const Size(80, 40),
                                            maximumSize: const Size(80, 40),
                                            side: const BorderSide(width: 1, color: Color(0xff006A6A)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFFFFFF)),
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
                    await context.read<CounsellorProvider>().editProfile(
                        _cname.text,
                        _cemail.text,
                        specialisation.dropDownValue!.value.toString());
                    // Navigator.pop(context);
                    // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => HomeUser()));
                  },
                  child: Text(
                    "SAVE ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff006A6A),
                    minimumSize: Size(300, 50),
                    side: BorderSide(width: 1, color: Color(0xff006A6A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
