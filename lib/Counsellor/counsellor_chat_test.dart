import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import '../Models/Chats/ChatRoom.dart';
import 'package:provider/provider.dart';


class ChatScreenCounsellor extends StatefulWidget {
  String chatSessionId;
  String userId;
  String userName;
  String userImage;
  ChatScreenCounsellor({Key? key, required this.chatSessionId, required this.userId, required this.userName, required this.userImage}) : super(key: key);

  @override
  State<ChatScreenCounsellor> createState() => _ChatScreenCounsellorState();
}

class _ChatScreenCounsellorState extends State<ChatScreenCounsellor> {
  // List<ChatMessage> data = [
  //   ChatMessage(message: "Hi", messagetype: "sender"),
  //   ChatMessage(message: "Hello", messagetype: "reciever"),
  //   ChatMessage(message: "Rates?", messagetype: "sender"),
  //   ChatMessage(message: "Please Wait", messagetype: "reciever"),
  // ];

  final TextEditingController _message = TextEditingController();
  final ScrollController _scrollController =
  ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    context.watch<CounsellorProvider>().getChatRoom(widget.chatSessionId);
    List<Messages>? chat=  context.read<CounsellorProvider>().chatRoom!.messages;

    // _scrolltobottom();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.userName,
            style: TextStyle(
              fontSize: 24,
              fontFamily: "MontserratMedium",
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0xff006A6A),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Background.jpeg"),
                  fit: BoxFit.cover)),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Container(
              //
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 16,
              //         left: 16.0, right: 16.0, bottom: 10.0),
              //     child: Image.network(
              //       widget.userImage,
              //       width: 100,
              //       height: 120,
              //     ),
              //   ),
              // ),
              // Container(
              //   child: Text(
              //     widget.userName,
              //     style: TextStyle(
              //       fontSize: 24,
              //       fontFamily: "MontserratMedium",
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16.0, right: 16.0, bottom: 10.0),
              //   child: Image.asset(
              //     "assets/images/ProfilePic.png",
              //     // width: 150,
              //     // height: 180,
              //   ),
              // ),
              _messageSpace(chat!),
              _inputSpace(chat)
            ],
          ),
        ),
      ),
    );
  }

  Widget _messageSpace(List<Messages?> chat) {
    // return Container(
    //   width: double.infinity,
    //    height: 600,
    //   color: Colors.red,
    // );
    return Flexible(
        child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: ListView.builder(
                itemCount: chat.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (chat[index]!.fromId == widget.userId)
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xff006A6A),
                              width: 2,
                            ),
                            color: (chat[index]!.fromId == widget.userId)
                                ? const Color(0xff006A6A)
                                : const Color(0xffFFFFFF)),
                        child: Text(
                          chat[index]!.message.toString(),
                          style: TextStyle(
                              color: (chat[index]!.fromId == widget.userId)
                                  ? const Color(0xffFFFFFF)
                                  : const Color(0xff006A6A)),
                        ),
                      ),
                    ),
                  );
                })));
  }

  Widget _inputSpace(List<Messages?>chat) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                controller: _message,
                // onSubmitted: (String str) {
                //   addMessage(_message.text);
                // },
                decoration: InputDecoration(
                  hintText: "Type Message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              )),
          FloatingActionButton(
              onPressed: () {
                addMessage(_message.text,chat);
              },
              backgroundColor: Color(0xff006A6A),
              child: const Icon(
                Icons.send_sharp,
                color: Colors.white,
                size: 20,
              ))
          // Icon(Icons.send_sharp,
          //   color: Color(0xff006A6A),
          // )
        ],
      ),
    );
  }

  addMessage(String message, List<Messages?>chat) async{
    _message.text = "";
    await context.read<CounsellorProvider>().sendMessage(new Messages(id: chat.length+1, toId: widget.userId, fromId:context.read<CounsellorProvider>().counsellor.id.toString() , message: message));
    //data.add(ChatMessage(message: input, messagetype: "sender"));  setState(() {});
  }

  _scrolltobottom() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }
}

class ChatMessage {
  final String message;
  final String messagetype;

  ChatMessage({required this.message, required this.messagetype});
}
