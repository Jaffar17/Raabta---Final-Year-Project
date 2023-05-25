// import 'package:dropdown_textfield/dropdown_textfield.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:raabta_fyp/Models/Chats/ChatRoom.dart';
// import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
// import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
// import '../../Models/counsellor/counsellor_notes_model.dart';
// import '../../Models/user/user_model.dart';
// import 'counsellor_repository.dart';
//
//
//
// class CounsellorProvider with ChangeNotifier{
//   Counsellor counsellor = Counsellor();
//   List<Appointments> confirmedAppointments=[];
//   final CounsellorRepository _counsellorRepository= FirebaseCounsellorRepository();
//   bool isLoading=false;
//   List<ChatRoom> chats=[];
//   late ChatRoom? chatRoom=ChatRoom();
//   List<Messages>?counsellorChats=[];
//   List<DropDownValueModel>patients_for_notes=[];
//
//   Future<void>addCounsellor(Counsellor counsellor)async{
//     await _counsellorRepository.addCounsellor(counsellor);
//   }
//   Future<Counsellor>getCounsellorById(String id)async{
//     counsellor = await _counsellorRepository.getCounsellorById(id);
//     notifyListeners();
//     return counsellor;
//   }
//   Future<void>profileComplete(String dob, String gender, String specialisation)async {
//     counsellor.dob = dob;
//     counsellor.gender = gender;
//     counsellor.specialisation = specialisation;
//     notifyListeners();
//     await _counsellorRepository.addCounsellor(counsellor);
//   }
//
//   Future<void>editProfile(String name, String email, String specialisation)async {
//     counsellor.displayName = name;
//     counsellor.email = email;
//     counsellor.specialisation = specialisation;
//     notifyListeners();
//     await _counsellorRepository.addCounsellor(counsellor);
//   }
//
//   Future<void>getAppointments()async{
//     counsellor=  await _counsellorRepository.getCounsellorById(counsellor.id.toString());
//     notifyListeners();
//
//
//   }
//
//   void acceptAppointment(Appointments appointment)async{
//     UserModel user = await _counsellorRepository.getUserById(appointment.userId.toString());
//     for(var i=0; i<user.appointments!.length;i++ ){
//       if(user!.appointments![i].id==appointment.id){
//         user!.appointments![i].status="Confirmed";
//         break;
//       }
//     }
//     for(var i=0; i<counsellor.appointments!.length;i++ ){
//       if(counsellor!.appointments![i].id==appointment.id){
//         counsellor!.appointments![i].status="Confirmed";
//         break;
//       }
//     }
//     await _counsellorRepository.updateAppointment(counsellor,user);
//     notifyListeners();
//
//
//   }
//   void rejectAppointment(Appointments appointment)async{
//     UserModel user = await _counsellorRepository.getUserById(appointment.userId.toString());
//     for(var i=0; i<user.appointments!.length;i++ ){
//       if(user!.appointments![i].id==appointment.id){
//         user!.appointments![i].status="Rejected";
//         break;
//       }
//     }
//     for(var i=0; i<counsellor.appointments!.length;i++ ){
//       if(counsellor!.appointments![i].id==appointment.id){
//         counsellor!.appointments![i].status="Rejected";
//         break;
//       }
//     }
//     await _counsellorRepository.updateAppointment(counsellor,user);
//     notifyListeners();
//
//   }
//   Future<void> getConfirmedAppointments()async{
//     confirmedAppointments=[];
//     counsellor.appointments!.forEach((element) {if(element.status=="Confirmed")confirmedAppointments.add(element) ;});
//     notifyListeners();
//   }
//   //new edit
//   Future<void>getChats()async{
//     chats=[];
//     notifyListeners();
//     List<ChatRoom> allChats=await _counsellorRepository.getAllChats();
//     allChats.forEach((element)=>{
//       if(element.counsellorId == counsellor.id){
//         chats.add(element)
//       }
//     });
//     notifyListeners();
//     print(chats);
//
//   }
//
//   Future<ChatRoom?> getChatRoom(String chatRoomId) async{
//     print("controller before repo");
//     chatRoom =    await _counsellorRepository.getChatRoom(chatRoomId) ;
//     notifyListeners();
//     print("controller after repo");
//   }
//   Future<void>sendMessage(Messages message)async{
//     chatRoom!.messages!.add(message);
//     print(chatRoom);
//     await _counsellorRepository.sendMessage(chatRoom!);
//     notifyListeners();
//   }
//
//   void getPatientsListForNotes(){
//     patients_for_notes=[];
//     for( var i=0; i<counsellor.appointments!.length;i++){
//       if(counsellor.appointments![i].status=="Confirmed" && patients_for_notes.contains(DropDownValueModel(name: counsellor.appointments![i].patientName.toString(), value: counsellor.appointments![i].patientName))==false){
//         patients_for_notes.add(DropDownValueModel(name: counsellor.appointments![i].patientName.toString(), value: counsellor.appointments![i].patientName));
//         notifyListeners();
//       }
//     }
//     print(patients_for_notes);
//   }
//
//   Future<void>addNotes(Notes note)async{
//     counsellor.notes!.add(note);
//     await _counsellorRepository.addCounsellor(counsellor);
//     notifyListeners();
//   }
// }
//
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:raabta_fyp/Models/Chats/ChatRoom.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_appointments.dart';
import 'package:raabta_fyp/Models/counsellor/counsellor_model.dart';
import '../../Models/counsellor/counsellor_notes_model.dart';
import '../../Models/user/user_model.dart';
import '../../Models/user/video_response_model.dart';
import 'counsellor_repository.dart';

class CounsellorProvider with ChangeNotifier {
  Counsellor counsellor = Counsellor();
  List<Appointments> confirmedAppointments=[];
  final CounsellorRepository _counsellorRepository= FirebaseCounsellorRepository();
  bool isLoading=true;
  List<ChatRoom> chats=[];
  late ChatRoom? chatRoom=ChatRoom();
  List<Messages>?counsellorChats=[];
  List<DropDownValueModel>patients_for_notes=[];
  List<UserModel> Clients = [];
  Map<String, double>emotionDetectionResults = {};

  Future<void> addCounsellor(Counsellor counsellor) async {
    await _counsellorRepository.addCounsellor(counsellor);
  }

  Future<Counsellor> getCounsellorById(String id) async {
    counsellor = await _counsellorRepository.getCounsellorById(id);
    notifyListeners();
    return counsellor;
  }

  Future<void> profileComplete(
      String dob, String gender, String specialisation) async {
    counsellor.dob = dob;
    counsellor.gender = gender;
    counsellor.specialisation = specialisation;
    notifyListeners();
    await _counsellorRepository.addCounsellor(counsellor);
  }

  Future<void> editProfile(
      String name, String email, String specialisation) async {
    counsellor.displayName = name;
    counsellor.email = email;
    counsellor.specialisation = specialisation;
    notifyListeners();
    await _counsellorRepository.addCounsellor(counsellor);
  }

  Future<void> getAppointments() async {
    counsellor =
        await _counsellorRepository.getCounsellorById(counsellor.id.toString());
    notifyListeners();
  }

  void acceptAppointment(Appointments appointment) async {
    UserModel user =
        await _counsellorRepository.getUserById(appointment.userId.toString());
    for (var i = 0; i < user.appointments!.length; i++) {
      if (user!.appointments![i].id == appointment.id) {
        user!.appointments![i].status = "Confirmed";
        //searchClient(user)? null : Clients.add(user);
        break;
      }
    }
    for (var i = 0; i < counsellor.appointments!.length; i++) {
      if (counsellor!.appointments![i].id == appointment.id) {
        counsellor!.appointments![i].status = "Confirmed";
        break;
      }
    }
    await _counsellorRepository.updateAppointment(counsellor, user);
    notifyListeners();
  }

  void rejectAppointment(Appointments appointment) async {
    UserModel user =
        await _counsellorRepository.getUserById(appointment.userId.toString());
    for (var i = 0; i < user.appointments!.length; i++) {
      if (user!.appointments![i].id == appointment.id) {
        user!.appointments![i].status = "Rejected";
        break;
      }
    }
    for (var i = 0; i < counsellor.appointments!.length; i++) {
      if (counsellor!.appointments![i].id == appointment.id) {
        counsellor!.appointments![i].status = "Rejected";
        break;
      }
    }
    await _counsellorRepository.updateAppointment(counsellor, user);
    notifyListeners();
  }

  void getConfirmedAppointments() {
    isLoading = true;
    notifyListeners();
    confirmedAppointments = [];
    Clients = [];
    counsellor.appointments!.forEach((element) {
      if (element.status == "Confirmed") {
        confirmedAppointments.add(element);
      }
    });
    updateClients(confirmedAppointments);
    isLoading = false;
    notifyListeners();
  }

  //new edit
  Future<void> getChats() async {
    chats = [];
    notifyListeners();
    List<ChatRoom> allChats = await _counsellorRepository.getAllChats();
    allChats.forEach((element) => {
          if (element.counsellorId == counsellor.id) {chats.add(element)}
        });
    notifyListeners();
    print(chats);
  }

  Future<ChatRoom?> getChatRoom(String chatRoomId) async {
    print("controller before repo");
    chatRoom = await _counsellorRepository.getChatRoom(chatRoomId);
    notifyListeners();
    print("controller after repo");
  }

  Future<void> sendMessage(Messages message) async {
    chatRoom!.messages!.add(message);
    print(chatRoom);
    await _counsellorRepository.sendMessage(chatRoom!);
    notifyListeners();
  }

  void getPatientsListForNotes() {
    patients_for_notes = [];
    for (var i = 0; i < counsellor.appointments!.length; i++) {
      if (counsellor.appointments![i].status == "Confirmed" &&
          patients_for_notes.contains(DropDownValueModel(
                  name: counsellor.appointments![i].patientName.toString(),
                  value: counsellor.appointments![i].patientName)) ==
              false) {
        patients_for_notes.add(DropDownValueModel(
            name: counsellor.appointments![i].patientName.toString(),
            value: counsellor.appointments![i].patientName));
        notifyListeners();
      }
    }
    print(patients_for_notes);
  }

  Future<void> addNotes(Notes note) async {
    counsellor.notes!.add(note);
    await _counsellorRepository.addCounsellor(counsellor);
    notifyListeners();
  }

  bool searchClient(UserModel user) {
    bool exist = false;
    for (var i = 0; i < Clients.length; i++) {
      if (Clients[i].id == user.id) {
        exist = true;
        break;
      } else {
        continue;
      }
    }
    return exist;
  }

  Future<void> updateClients(List<Appointments> confirmedAppointment) async {
    Clients = [];
    notifyListeners();
    UserModel user = UserModel();
    for (var i = 0; i < confirmedAppointment.length; i++) {
      user = await _counsellorRepository
          .getUserById(confirmedAppointment[i].userId.toString());
      if (searchClient(user) == false) {
        Clients.add(user);
      } else {
        continue;
      }
    }
    notifyListeners();
  }

  Future <void> getEmotionDetectionResults(String userId)async{
    isLoading=true;
    notifyListeners();
    VideoResponse? resp =  await _counsellorRepository.getEmotionDetectionResults(userId.toString()) ;
    if(resp!=null) {
      emotionDetectionResults!["angry"] = resp.emotions!["angry"];
      emotionDetectionResults!["disgust"] = resp.emotions!["disgust"];
      emotionDetectionResults!["fear"] = resp.emotions!["fear"];
      emotionDetectionResults!["happy"] = resp.emotions!["happy"];
      emotionDetectionResults!["neutral"] = resp.emotions!["neutral"];
      emotionDetectionResults!["sad"] = resp.emotions!["sad"];
      emotionDetectionResults!["surprise"] = resp.emotions!["surprise"];
      isLoading=false;
      notifyListeners();
      print(emotionDetectionResults!.toString() +"exist");

    }
    else{
      isLoading=false;
      emotionDetectionResults={};
      notifyListeners();
      print(emotionDetectionResults!.toString() +"does not exist");
    }
  }

}
