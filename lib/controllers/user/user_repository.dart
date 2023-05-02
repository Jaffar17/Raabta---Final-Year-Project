import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import '../../Models/Chats/ChatRoom.dart';
import '../../Models/counsellor/counsellor_model.dart';

abstract class UserRepository {
  Future<void> addUser(UserModel user);

  Future<UserModel> getUser(String id);

  Future<List<Counsellor>> getAllCounsellors();

  Future<void> createAppointment(UserModel user);

  Future<void> setAppointment(Counsellor counsellor);

  Future<void> createChatSession(ChatRoom chatRoom);

  Future<ChatRoom?> getChatRoom(String chatRoomId);

  Future<void> sendMessage(ChatRoom chatRoom);
  Future<List<ChatRoom>> getAllChats();


}

class FirebaseUsersRepository implements UserRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> addUser(UserModel user) async {
    await db.collection('users').doc(user.id.toString()).set(user.toJson());
  }

  Future<UserModel> getUser(String id) async {
    UserModel user = UserModel();
    await db
        .collection("users")
        .doc(id.toString())
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      user =
          UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
    });
    return user;
  }

  Future<List<Counsellor>> getAllCounsellors() async {
    List<Counsellor> counsellors = [];
    await db
        .collection('counsellors')
        .get()
        .then((value) => value.docs.forEach((element) {
              counsellors.add(Counsellor.fromJson(element.data()));
            }));
    return counsellors;
  }

  Future<void> createAppointment(UserModel user) async {
    await db.collection('users').doc(user!.id.toString()).set(user.toJson());
  }

  Future<void> setAppointment(Counsellor counsellor) async {
    await db
        .collection('counsellors')
        .doc(counsellor!.id.toString())
        .set(counsellor.toJson());
  }

  Future<void> createChatSession(ChatRoom chatRoom) async {
    await db
        .collection('chats')
        .doc(chatRoom.id.toString())
        .set(chatRoom.toJson());
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

  Future<List<ChatRoom>>getAllChats()async{
    List<ChatRoom>chats=[];
    await db.collection('chats').get().then((value)=> value.docs.forEach((element){chats.add(ChatRoom.fromJson(element.data()));}));
    return chats;
  }


}
