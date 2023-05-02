import 'package:flutter/material.dart';
import 'package:raabta_fyp/controllers/counsellor/counsellor_provider.dart';
import 'package:raabta_fyp/controllers/user/user_provider.dart';
import '../Models/Chats/ChatRoom.dart';
import 'package:provider/provider.dart';
class ChatRoomScreenCounsellor extends StatefulWidget {
  String chatSessionId;
  String userId;
  String userName;
  ChatRoomScreenCounsellor({Key? key, required this.chatSessionId, required this.userId, required this.userName }) : super(key: key);

  @override
  State<ChatRoomScreenCounsellor> createState() => _ChatRoomState();
}


class _ChatRoomState extends State<ChatRoomScreenCounsellor> {


  @override
  Widget build(BuildContext context) {
    context.watch<CounsellorProvider>().getChatRoom(widget.chatSessionId);
    List<Messages>? chat=  context.read<CounsellorProvider>().chatRoom!.messages;
    return SafeArea(
        child: Scaffold(
            body:Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: chat!.length,
                    itemBuilder: (context,index){
                      if(chat[index].fromId==context.read<CounsellorProvider>().counsellor.id.toString() && chat[index].toId==widget.userId) {
                        return Card(
                            child: ListTile(
                              title:  Text(context.read<CounsellorProvider>().counsellor.displayName.toString()),
                              subtitle: Text(chat[index].message.toString()),
                            )
                        );
                      }
                      else{
                        return Card(
                            child: ListTile(
                              title: Text(widget.userName),
                              subtitle: Text(chat[index].message.toString()),
                            )
                        );
                      }
                    }),
                ElevatedButton(onPressed: ()async
                {
                  await context.read<CounsellorProvider>().sendMessage(new Messages(id: chat.length+1, toId: widget.userId, fromId:context.read<CounsellorProvider>().counsellor.id.toString() , message: "newmessage from counsellor"));
                }, child:Icon(Icons.send))
              ],
            )
        )
    );
  }
}
