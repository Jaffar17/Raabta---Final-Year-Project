import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/controllers/user/user_repository.dart';
import 'package:raabta_fyp/Models/user/user_model.dart';
import 'package:raabta_fyp/Models/user/user_appointments.dart';
import '../../Models/Chats/ChatRoom.dart';
import '../../Models/counsellor/counsellor_model.dart';
import '../../Models/counsellor/counsellor_appointments.dart';
import '../../Models/user/video_response_model.dart';
import 'user_repository.dart';

class UserProvider with ChangeNotifier {
  final UserRepository _userRepository = FirebaseUsersRepository();
  UserModel user = UserModel();
  List<Counsellor> counsellors = [];
  bool isLoading = true;
  late ChatRoom? chatRoom = ChatRoom();
  List<ChatRoom> userChats = [];
  //yeh key value hata k dekhna
  Map<String,double>?emotions={};

  Future<UserModel> getUser(String id) async {
    user = await _userRepository.getUser(id);
    isLoading = false;
    notifyListeners();
    return user;
  }

  Future<void> addUser(UserModel user) async {
    await _userRepository.addUser(user);
  }

  Future<void> profileComplete(
      String dob, String gender, String preference) async {
    user.dateOfBirth = dob;
    user.preference = preference;
    user.gender = gender;
    notifyListeners();
    await _userRepository.addUser(user);
  }

  Future<void> getCounsellors() async {
    isLoading = true;
    notifyListeners();
    counsellors = await _userRepository.getAllCounsellors();
    isLoading = false;
    notifyListeners();
  }

  Future<void> editProfile(
      String fullName, String email, String preference) async {
    user.fullName = fullName;
    user.preference = preference;
    user.email = email;
    notifyListeners();
    await _userRepository.addUser(user);
  }

  Future<void> getAppointments() async {
    user = await getUser(user.id!);
    notifyListeners();
  }

  Future<void> createAppointment(UserAppointments u_appointment) async {
    user.appointments!.add(u_appointment);
    notifyListeners();
    await _userRepository.createAppointment(user);
  }

  Future<void> setAppointment(
      Counsellor counsellor, Appointments c_appointment) async {
    counsellor.appointments!.add(c_appointment);
    await _userRepository.setAppointment(counsellor);
  }

  Future<void> createChatSession(ChatRoom chatRoom) async {
    await _userRepository.createChatSession(chatRoom);
  }

  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    print("controller before repo");
    chatRoom = await _userRepository.getChatRoom(chatRoomId);
    print("controller after repo");
    if (chatRoom != null) {
      print(chatRoom!.messages);
      notifyListeners();
    } else {
      chatRoom = null;
      notifyListeners();
    }
  }

  Future<void> sendMessage(Messages message) async {
    //userchat!.add(message);
    chatRoom!.messages!.add(message);
    print(chatRoom!.messages);
    await _userRepository.sendMessage(chatRoom!);
    notifyListeners();
  }

//new edited
  Future<List<ChatRoom>> getUserChats() async {
    print(userChats);
    print("inside controller before fetch");
    userChats = [];
    List<ChatRoom> allChats = await _userRepository.getAllChats();
    allChats.forEach((element) {
      if (element.userId == user.id) {
        userChats.add(element);
      }
    });
    notifyListeners();
    print('after fetching');
    print(userChats);
    return userChats;
  }

  Future<void> addVideoResponse(VideoResponse responseObject) async {
    await _userRepository.addVideoResponse(responseObject);
  }

  Future<void>getVideoResponse() async{
    isLoading=true;
    notifyListeners();
    VideoResponse? resp =  await _userRepository.getVideoResponse(user.id.toString()) ;
      if(resp!=null) {
        emotions!["angry"] = resp.emotions!["angry"];
        emotions!["disgust"] = resp.emotions!["disgust"];
        emotions!["fear"] = resp.emotions!["fear"];
        emotions!["happy"] = resp.emotions!["happy"];
        emotions!["neutral"] = resp.emotions!["neutral"];
        emotions!["sad"] = resp.emotions!["sad"];
        emotions!["surprise"] = resp.emotions!["surprise"];
        isLoading=false;
        notifyListeners();
        print(emotions!.toString() +"exist");

      }
      else{
        isLoading=false;
        emotions={};
        notifyListeners();
        print(emotions!.toString() +"does not exist");
      }

  }

  Future<void>personalityEvaluation(List<double> answers)async{
    user.Ptest!.extroversion= double.parse((4 +answers[0]-answers[5]).toStringAsFixed(2));
    user.Ptest!.Agreeableness = double.parse((2.8 - answers[1] + answers[6]).toStringAsFixed(2));
    user.Ptest!.conscientiousness = double.parse(( 2.8 + answers[2] - answers[7]).toStringAsFixed(2));
    user.Ptest!.neurotocism = double.parse((7.6 -answers[3] + answers[8]).toStringAsFixed(2));
    user.Ptest!.openess = double.parse((1.6 + answers[4] - answers[9]).toStringAsFixed(2));
    notifyListeners();
    await _userRepository.addUser(user);
  }
}
