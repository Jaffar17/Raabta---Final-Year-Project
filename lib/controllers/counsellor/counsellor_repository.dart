import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raabta_fyp/Models/Chats/ChatRoom.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';

import '../../Models/user/user_model.dart';
import '../../Models/user/video_response_model.dart';

abstract class CounsellorRepository {
  Future<void> addCounsellor(Counsellor counsellor);

  Future<Counsellor> getCounsellorById(String id);

  Future<UserModel> getUserById(String id);

  Future<void> updateAppointment(Counsellor counsellor, UserModel user);

  Future<List<ChatRoom>> getAllChats();

  Future<ChatRoom?> getChatRoom(String chatRoomId);

  Future<void> sendMessage(ChatRoom chatRoom);

  Future<VideoResponse?> getEmotionDetectionResults(String userId);
}

class FirebaseCounsellorRepository implements CounsellorRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addCounsellor(Counsellor counsellor) async {
    await db
        .collection('counsellors')
        .doc(counsellor.id)
        .set(counsellor.toJson());
  }

  Future<Counsellor> getCounsellorById(String id) async {
    Counsellor counsellor = Counsellor();
    await db
        .collection("counsellors")
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      counsellor =
          Counsellor.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
    return counsellor;
  }

  Future<void> updateAppointment(Counsellor counsellor, UserModel user) async {
    await db
        .collection("counsellors")
        .doc(counsellor!.id.toString())
        .update(counsellor.toJson());
    await db.collection("users").doc(user!.id.toString()).update(user.toJson());
  }

  Future<UserModel> getUserById(String id) async {
    UserModel user = UserModel();
    await db
        .collection("users")
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      user =
          UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
    return user;
  }

  Future<List<ChatRoom>> getAllChats() async {
    List<ChatRoom> chats = [];
    await db.collection('chats').get().then((value) => {
          value.docs.forEach((element) {
            chats.add(ChatRoom.fromJson(element.data()));
          })
        });
    return chats;
  }

  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    ChatRoom chatRoom = ChatRoom();
    try {
      await db
          .collection('chats')
          .doc(chatRoomId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        chatRoom =
            ChatRoom.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      });
      print(chatRoom.toString() + "firebases");
      return chatRoom;
    } catch (e) {
      print("Exception");
      return null;
    }
  }

  Future<void> sendMessage(ChatRoom chatRoom) async {
    await db
        .collection('chats')
        .doc(chatRoom.id.toString())
        .set(chatRoom.toJson());
  }

  Future<VideoResponse?> getEmotionDetectionResults(String userId) async {
    try {
      VideoResponse? response = VideoResponse();
      await db.collection('user-video-responses').doc(userId).get().then(
          (DocumentSnapshot documentSnapshot) => response =
              VideoResponse.fromJson(
                  documentSnapshot.data() as Map<String, dynamic>));
      return response;
    } catch (e) {
      return null;
    }
  }
}
