import 'package:raabta_fyp/Models/user/user_model.dart';

class Appointments{
  String? id;
  String? userId;
  String?photoUrl;
  String ?appointmentDate;
  String? appointmentTime;
  String status="Pending";
  String? patientName;


  Appointments({
    this.id,
    this.appointmentTime,
    this.appointmentDate,
    this.photoUrl,
    this.patientName,
    this. userId
  });

  Appointments.fromJson(Map<String,dynamic>json){
    id= json['id'];
    userId=json["userId"];
    photoUrl=json['photoUrl'];
    patientName=json['patientName'];
    appointmentDate=json['appointmentDate'];
    appointmentTime=json['appointmentTime'];
    status=json['status'];

  }


  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['photoUrl']=photoUrl;
    data['patientName']=patientName;
    data['appointmentDate']=appointmentDate;
    data['appointmentTime']=appointmentTime;
    data['status']=status;
    data["userId"]=userId;
    return data;
  }




}