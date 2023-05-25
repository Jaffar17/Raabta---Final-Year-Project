import 'package:flutter/material.dart';
import 'package:raabta_fyp/User/user_chat_screen.dart';
import 'package:raabta_fyp/User/user_chat_test.dart';

import '../Models/Chats/ChatRoom.dart';
import 'package:provider/provider.dart';

import '../controllers/user/user_provider.dart';
class InboxUser extends StatefulWidget {
  const InboxUser({Key? key}) : super(key: key);

  @override
  State<InboxUser> createState() => _InboxUserState();
}

class _InboxUserState extends State<InboxUser> {
  List<TestData> tdList = [
    TestData(name: "Patient 1", message: "Hello there!"),
    TestData(name: "Patient 1", message: "Hello there!"),
    TestData(name: "Patient 1", message: "Hello there!"),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().getUserChats();

  }

  @override
  Widget build(BuildContext context) {
    List<ChatRoom> chats = context.watch<UserProvider>().userChats;
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
                    top: 25, bottom: 8, right: 120, left: 120),
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xFFF6BD12), width: 2))),
                  child: const Text(
                    "Inbox",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "MontserratMedium",
                      //fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              chats.isNotEmpty? Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 4.0, right: 18, left: 18),
                        child: Card(
                          elevation: 8,
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
                             leading: Image.network(chats[index].counsellorImage.toString()),
                            title: Text(
                              chats[index].counsellorName.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "MontserratMedium",
                              ),
                            ),
                            subtitle: Text(
                                "${chats[index].messages![0].message.toString()}..."),
                            onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder:(context)=> ChatScreenUser(chatSessionId: chats[index].id.toString(), counsellorId: chats[index].counsellorId.toString(), counsellorName: chats[index].counsellorName.toString(), counsellorImage: chats[index].counsellorImage.toString(),)));
                            },
                          ),

                        ),
                      );
                    }),
              ) : Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(child: Text("No messages to show.", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.blueGrey),)),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestData {
  String name;
  String message;

  TestData({required this.name, required this.message});
}
