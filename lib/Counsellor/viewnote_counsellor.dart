import 'package:flutter/material.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'package:provider/provider.dart';
import '../Models/counsellor/counsellor_notes_model.dart';
import '../controllers/counsellor/counsellor_provider.dart';

class ViewNotesCounsellor extends StatefulWidget {
  int note_id;
  ViewNotesCounsellor({Key? key, required this.note_id}) : super(key: key);

  @override
  State<ViewNotesCounsellor> createState() => _ViewNotesCounsellorState();
}

class _ViewNotesCounsellorState extends State<ViewNotesCounsellor> {

  TextEditingController _cnotes = new TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    _cnotes.text = 'Improvement can be seen';
  }


    @override
  Widget build(BuildContext context) {
      Notes note = context.read<CounsellorProvider>().counsellor.notes![widget.note_id];
      _cnotes.text = note.note.toString();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color(0xFFF6BD12), width: 2))),
                      child: Text(
                        "View Notes",
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, bottom: 10.0),
                          child: Image.asset(
                            "assets/images/ProfilePic.png",
                             width: 120,
                             // height: 140,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,  bottom: 4),
                          child: Text(note.patientName.toString(), style: TextStyle(fontSize: 22, fontFamily: "MontserratMedium", ),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(  bottom: 20),
                          child: Text(note.Date.toString(), style: TextStyle(fontSize: 16,  ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12.0, bottom: 15.0),
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            elevation: 12,
                            child: TextField(
                              controller: _cnotes,
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              "CLOSE ",
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "MontserratMedium",
                                //fontWeight: FontWeight.w500,
                              ),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffF93535),
                              minimumSize: Size(300, 50),
                              side: BorderSide(width: 1, color: Color(0xffFFFFFF)),
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

            ],
          ),
        ),
      ),
    );
  }
}
