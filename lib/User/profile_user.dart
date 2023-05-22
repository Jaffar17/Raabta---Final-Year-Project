import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:intl/intl.dart';
import '../controllers/user/user_provider.dart';
import 'package:raabta_fyp/User/navbar_user.dart';
import 'package:raabta_fyp/User/personality_test.dart';
import 'package:raabta_fyp/User/viewprofile_user.dart';
import 'package:provider/provider.dart';

class ProfileUser extends StatefulWidget {
   const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}
//Test Comment
//Subhan
class _ProfileUserState extends State<ProfileUser> {

  TextEditingController dOBController = TextEditingController();

  SingleValueDropDownController gender = SingleValueDropDownController();

  SingleValueDropDownController preference = SingleValueDropDownController();

  TextEditingController name = TextEditingController();
  bool dobValue = true;
  bool genderValue = true;
  bool prefValue = true;
  bool nameValue = true;


  void initState() {
    super.initState();
    name.text= context.read<UserProvider>().user.fullName!;
  }

  void dispose() {
    dOBController.dispose();
    gender.dispose();
    preference.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dobValue = true;
    genderValue = true;
    prefValue = true;
    nameValue = true;

    if (dOBController.text == "" || dOBController.text.length <=0){
      dobValue = false;
    }
    if (name.text == ""){
      nameValue = false;
    }
    if (gender.dropDownValue == null){
      genderValue = false;
    }
    if(preference.dropDownValue == null){
      prefValue = false;
    }

    return SafeArea(
        child:
        Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
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
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFF6BD12), width: 2))),
                      child: const Text(
                        "Profile Completeness",
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
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText:"Full Name",
                        errorText: nameValue ? null: "Name is empty!",
                        labelStyle: const TextStyle(color: Color(0xff006A6A)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff006A6A)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff006A6A)),
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
                      controller: dOBController,
                      // onChanged: (value){
                      //   setState(() {
                      //     dobValue = isDOBValid(dOBController);
                      //   });
                      // },
                      //editing controller of this TextField
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        errorText: dobValue ? null : "Please select Date of Birth",
                        labelStyle: const TextStyle(color: Color(0xff006A6A)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff006A6A)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xff006A6A)),
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
                          labelStyle: const TextStyle(color: Color(0xff006A6A)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff006A6A)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff006A6A)),
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
                      dropDownItemCount: 6,

                      dropDownList: const [
                        DropDownValueModel(name: 'Male', value: "Male"),
                        DropDownValueModel(
                          name: 'Female',
                          value: "Female",
                        ),
                        DropDownValueModel(name: 'Others', value: "Others"),
                      ],

                    ),
                  ),
                  // Recommendation Tag
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 20.0),
                    child: DropDownTextField(
                      controller: preference,
                      clearOption: true,
                      textFieldDecoration: InputDecoration(
                          labelText: "Looking Help For?",
                          labelStyle: const TextStyle(color: Color(0xff006A6A)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff006A6A)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Color(0xff006A6A)),
                          ),
                          // enableSearch: true,
                          // dropdownColor: Colors.green,
                          //searchDecoration:

                          hintText: "What are you looking for?"),

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

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: ElevatedButton(
                      onPressed: () async{
                        setState(() {
                          if (dOBController.text == "" || dOBController.text.length <=0){
                            dobValue = false;
                          }
                          if (name.text == ""){
                            nameValue = false;
                          }
                          if (gender.dropDownValue == null){
                            genderValue = false;
                          }
                          if(preference.dropDownValue == null){
                            prefValue = false;
                          }
                        });
                        print("dob");
                        print(nameValue);

                        //print(dOBController.text + gender.dropDownValue!.name + preference.dropDownValue!.name);
                        if (dobValue == true && nameValue == true && genderValue== true && prefValue== true){
                          await context.read<UserProvider>().profileComplete(dOBController.text, gender.dropDownValue!.name, preference.dropDownValue!.name);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const PersonalityTest()));
                        }
                      },
                      child: const Text(
                        "NEXT ",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006A6A)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFFFFFF),
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
            ),
          ),
        )
    );
  }

  bool isNameValid(TextEditingController name){
    if (name.value!=null){
      return true;
    }
    else{
      return false;
    }
  }

  bool isDOBValid(TextEditingController dOBController){
    if (dOBController.value!= null){
      return true;
    }
    return false;
  }
}

