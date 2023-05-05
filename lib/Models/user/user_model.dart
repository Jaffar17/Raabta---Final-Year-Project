

import './personality_test.dart';
import './user_appointments.dart';

class UserModel{
  String? id;
  String? fullName;
  String? email;
  String? photoUrl;
  String? dateOfBirth;
  String? gender;
  String? preference;
  List<UserAppointments>?appointments;
  PersonalityTestModel? Ptest;
  UserModel({
     this.id,
     this.fullName,
     this.email,
     this.photoUrl,
     this. dateOfBirth,
     this.gender,
     this.preference,
    this.appointments,
    this.Ptest
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    dateOfBirth= json['dateOfBirth'];
    gender = json['gender'];
    preference = json['preference'];
    if (json['appointments'] != null) {
      appointments = <UserAppointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(UserAppointments.fromJson(v));
      });
    }

    if(json['pTest']!=null){
      Ptest = PersonalityTestModel.fromJson(json['pTest']);
    }

  }

  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id??"";
    data['fullName']=fullName;
    data['photoUrl'] = photoUrl;
    data['email'] = email;
    data['dateOfBirth']=dateOfBirth;
    data['gender']=gender;
    data ['preference']=preference;
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }

    if(Ptest!=null){
      data["pTest"]= Ptest!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, fullName: $fullName, email: $email, photoUrl: $photoUrl, dateOfBirth: $dateOfBirth, gender: $gender, preference: $preference}';
  }
}