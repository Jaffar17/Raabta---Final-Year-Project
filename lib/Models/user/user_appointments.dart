import '../counsellor/counsellor_model.dart';

class UserAppointments{
  String? id;
  String? counsellorName;
  String? photoUrl;
  String ?appointmentDate;
  String? appointmentTime;
  String status="Pending";

  UserAppointments({
     this.id,
    this.photoUrl,
    this.counsellorName,
      this.appointmentTime,
      this.appointmentDate,
});

  UserAppointments.fromJson(Map<String,dynamic>json){
    id=json['id'];
    counsellorName=json['counsellorName'];
    photoUrl= json['photoUrl'];
    appointmentDate=json['appointmentDate'];
    appointmentTime=json['appointmentTime'];
    status=json['status'];
  }

  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id']=id;
    data['counsellorName']=counsellorName;
    data['photoUrl']=photoUrl;
    data['appointmentDate']=appointmentDate;
    data['appointmentTime']=appointmentTime;
    data['status']=status;
    return data;
  }

}