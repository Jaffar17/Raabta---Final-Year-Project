import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewNoteCounsellor extends StatefulWidget {
  const NewNoteCounsellor({Key? key}) : super(key: key);

  @override
  State<NewNoteCounsellor> createState() => _NewNoteCounsellorState();
}

class _NewNoteCounsellorState extends State<NewNoteCounsellor> {

  TextEditingController dOBController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: Column(mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 36, bottom: 8, right: 70, left: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, size: 30,),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom:
                                    BorderSide(color: Color(0xFFF6BD12), width: 2))),
                            child: Text(
                              "New Notes",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: "MontserratMedium",
                                //fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(

                      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
                      child: Material(
                        elevation: 14,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            color: Colors.white54,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14, top: 12, bottom: 4),
                                child: Text("Patient:", style: TextStyle(fontSize: 22, fontFamily: "MontserratMedium", ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0, bottom: 20.0),
                                child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                  elevation: 12,

                                  child: SizedBox(
                                    height: 40,
                                    child: DropDownTextField(
                                      //initialValue: "name4",
                                      //controller: _cnt,
                                      clearOption: true,
                                      textFieldDecoration: InputDecoration(
                                    labelText: "Select Patient",
                                    // labelStyle: TextStyle(color: Color(0xff006A6A)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Color(0xff006A6A)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.black12),
                                  ),
                                ),
                                          // enableSearch: true,
                                          // dropdownColor: Colors.green,
                                          //searchDecoration:

                                          // hintText: "Select your gender"),

                                      validator: (value) {
                                        if (value == null) {
                                          return "Required field";
                                        } else {
                                          return null;
                                        }
                                      },
                                      dropDownItemCount: 3,

                                      dropDownList: const [
                                        DropDownValueModel(name: 'Patient 1', value: "value1"),
                                        DropDownValueModel(name: 'Patient 2', value: "value2",),
                                        DropDownValueModel(name: 'Patient 3', value: "value3"),
                                      ],
                                      //onChanged: (val) {},
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                child: Text("Date:", style: TextStyle(fontSize: 22, fontFamily: "MontserratMedium", ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 20.0),
                                child: Material(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  elevation: 12,
                                  child: SizedBox(
                                    height: 40,
                                    child: TextField(
                                      controller: dOBController,
                                      //editing controller of this TextField
                                      decoration: InputDecoration(
                                        // labelText: "Date of Birth",
                                        labelStyle: TextStyle(color: Color(0xff006A6A)),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(color: Color(0xff006A6A)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(12),
                                          borderSide: BorderSide(color: Colors.black12),
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
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                                child: Text("Notes:", style: TextStyle(fontSize: 22, fontFamily: "MontserratMedium", ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, bottom: 20.0),
                                child: Material(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  elevation: 12,
                                  child: TextField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                  // labelText: "Date of Birth",
                                  labelStyle: TextStyle(color: Color(0xff006A6A)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Color(0xff006A6A)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black12),
                        ),
                      ),
                                  ),
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (context) => NavBarCounsellor()));
                                  },
                                  child: Text(
                                    "ADD ",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: "MontserratMedium",
                                      //fontWeight: FontWeight.w500,
                                    ),),
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

                            ],
                          ),
                        ),
                      ),
                    ),

                  ]
              ),
            ),
      ),
    );
  }
}
