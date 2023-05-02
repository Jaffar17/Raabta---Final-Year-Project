import 'package:flutter/material.dart';
import 'package:raabta_fyp/Models/Chats/ChatRoom.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:provider/provider.dart';

import 'counsellor_chat_screen.dart';

class InboxCounsellor extends StatefulWidget {
  const InboxCounsellor({Key? key}) : super(key: key);

  @override
  State<InboxCounsellor> createState() => _InboxCounsellorState();
}

class _InboxCounsellorState extends State<InboxCounsellor> {
  List<TestDataMsg> tdList = [
    TestDataMsg(name: "Patient 1", message: "Hello there!"),
    TestDataMsg(name: "Patient 1", message: "Hello there!"),
    TestDataMsg(name: "Patient 1", message: "Hello there!"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CounsellorProvider>().getChats();
  }
  @override
  Widget build(BuildContext context) {
    List<ChatRoom>chats =context.watch<CounsellorProvider>().chats;
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
                    top: 36, bottom: 8, right: 140, left: 140),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                          BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "Inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "MontserratMedium",
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 4.0, right: 18, left: 18),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.black,
                        child: ListTile(
                          // shape: RoundedRectangleBorder(
                          //   side: const BorderSide(
                          //       //width: 2,
                          //    //   color: Colors.amberAccent
                          //   ),
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          leading: Image.network(chats[index].userImage.toString()),
                          title: Text(
                            chats[index].userName.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "MontserratMedium",
                            ),
                          ),
                          subtitle: Text(
                              "${chats[index].messages![0].message.toString()}..."),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:(context)=> ChatRoomScreenCounsellor(chatSessionId: chats[index].id.toString(), userId: chats[index].userId.toString(), userName: chats[index].userName.toString())));
                          },

                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
class TestDataMsg {
  String name;
  String message;

  TestDataMsg({required this.name, required this.message});
}