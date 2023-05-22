import 'package:flutter/material.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import '../Models/Chats/ChatRoom.dart';
import 'package:provider/provider.dart';

class ChatRoomScreen extends StatefulWidget {
  String chatSessionId;
  String counsellorId;
  String counsellorName;

  ChatRoomScreen(
      {Key? key,
      required this.chatSessionId,
      required this.counsellorId,
      required this.counsellorName})
      : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    context.watch<UserProvider>().getChatRoom(widget.chatSessionId);
    List<Messages>? chat = context.read<UserProvider>().chatRoom!.messages;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: chat!.length,
                      itemBuilder: (context, index) {
                        if (chat[index].fromId ==
                                context.read<UserProvider>().user.id.toString() &&
                            chat[index].toId == widget.counsellorId) {
                          return Card(
                              child: ListTile(
                            title: Text(context
                                .read<UserProvider>()
                                .user
                                .fullName
                                .toString()),
                            subtitle: Text(chat[index].message.toString()),
                          ));
                        } else {
                          return Card(
                              child: ListTile(
                            title: Text(widget.counsellorName),
                            subtitle: Text(chat[index].message.toString()),
                          ));
                        }
                      }),
                  ElevatedButton(
                      onPressed: () async {
                        await context.read<UserProvider>().sendMessage(
                            new Messages(
                                id: chat.length + 1,
                                toId: widget.counsellorId,
                                fromId: context
                                    .read<UserProvider>()
                                    .user
                                    .id
                                    .toString(),
                                message: "newmessage"));
                      },
                      child: Icon(Icons.send))
                ],
              ),
            )));
  }
}
