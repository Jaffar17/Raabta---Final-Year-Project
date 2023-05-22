import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user/user_provider.dart';

class EditprofileUser extends StatefulWidget {
  const EditprofileUser({Key? key}) : super(key: key);

  @override
  State<EditprofileUser> createState() => _EditprofileUserState();
}

class _EditprofileUserState extends State<EditprofileUser> {
  SingleValueDropDownController preference= new SingleValueDropDownController();
  TextEditingController _cname = new TextEditingController();
  TextEditingController _cemail = new TextEditingController();
  bool emailCheck = true;
  bool nameCheck = true;


  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _cname.text = context.read<UserProvider>().user.fullName!;
    _cemail.text = context.read<UserProvider>().user.email!;
    // preference.dropDownValue?.value =  context.read<UserProvider>().user.preference!;

  }

  @override
  Widget build(BuildContext context) {
    nameCheck = true;
    emailCheck = true;
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
                      image: AssetImage("assets/images/Background.jpeg"), fit: BoxFit.cover)),
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
                      child:Image.network(context.read<UserProvider>().user.photoUrl.toString()),
                        //"assets/images/ProfilePic.png",
                        // width: 150,
                        // height: 180,

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
                        decoration: InputDecoration(
                          labelText: "Email",
                          errorText: emailCheck? null: "Email is empty!",
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
                      child: DropDownTextField(
                        initialValue: context.read<UserProvider>().user.preference!,
                        // initialValue: "Anxiety Issues",
                        // controller: preference,
                        clearOption: true,
                        textFieldDecoration: InputDecoration(
                            labelText: "Looking Help For?",
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

                            hintText: context.read<UserProvider>().user.preference!,
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
                              name: 'Anxiety Issues', value: "Anxiety Issues"),
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
                      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                      child: ElevatedButton(
                        onPressed: () async{
                          setState(() {
                            if (_cname.text == ""){
                              nameCheck = false;
                            }
                            if (_cemail.text == ""){
                              emailCheck = false;
                            }
                          });
                          print("check:");
                          print(_cemail.text);
                          print(_cname.text);
                          print(preference.dropDownValue!.name);
                          await context.read<UserProvider>().editProfile(_cname.text, _cemail.text, preference.dropDownValue!.name);
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
                                                'Your profile has been updated.'),
                                          ),

                                          SizedBox(
                                            width: 320.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 12, right: 12),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Navigator.of(context, rootNavigator: true).pop();
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CounsellorsList())); // We need to route back to counsellors screen, as of now not happening
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: const Color(0xff006A6A),
                                                  minimumSize: const Size(100, 30),
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
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => ViewprofileUser()));
                        },
                        child: Text(
                          "SAVE ",
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: "MontserratMedium",
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
        ));
  }
}
