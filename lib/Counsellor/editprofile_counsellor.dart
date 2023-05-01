import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
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
  SingleValueDropDownController specialisation =
      new SingleValueDropDownController();

  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _cname.text = context.read<CounsellorProvider>().counsellor.displayName!;
    _cemail.text = context.read<CounsellorProvider>().counsellor.email!;
  }

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
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 35, bottom: 35, right: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 36,
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
                  controller: _cemail,
                  decoration: InputDecoration(
                    labelText: "Email",
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
                  //initialValue: "name4",
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
                    DropDownValueModel(name: 'Anxiety', value: "value1"),
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
                padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    await context.read<CounsellorProvider>().editProfile(
                        _cname.text,
                        _cemail.text,
                        specialisation.dropDownValue!.name);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ViewprofileUser()));
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
