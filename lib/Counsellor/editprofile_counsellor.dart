import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class EditprofielCounsellor extends StatefulWidget {
  const EditprofielCounsellor({Key? key}) : super(key: key);

  @override
  State<EditprofielCounsellor> createState() => _EditprofielCounsellorState();
}

class _EditprofielCounsellorState extends State<EditprofielCounsellor> {

  TextEditingController _cname = new TextEditingController();
  TextEditingController _cemail = new TextEditingController();
  TextEditingController _cpassword = new TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _cname.text = 'Counsellor 1';
    _cemail.text = 'counsellor1@gmail.com';
    _cpassword.text = 'counsellor123';
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
    image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
    child: Column(
    children: [
      Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0),
          child: Image.asset(
            "assets/images/ProfileHeading.png",
            width: 150,
            height: 200,
          ),
      ),
      Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 10.0),
          child: Image.asset(
            "assets/images/ProfilePic.png",
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
          //controller: _cnt,
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

              hintText: "Specialization"
          ),

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
        padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
        child: ElevatedButton(
          onPressed: () {
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
    ]
    ),
          ),
        ),
        ),
    );
  }
}
