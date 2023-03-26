

class Appointments{
  String? id;
  String? userId;
  String? counsellorId;
  String? appointmentDate;
  String? appointmentTime;
  String? status;

  Appointments({
    this.id,
    this.userId,
    this.counsellorId,
    this.appointmentDate,
    this.appointmentTime,
    this.status
});
  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    counsellorId = json['counsellorId'];
    appointmentDate= json['appointmentDate'];
    appointmentTime= json['appointmentTime'];
    status = json['status'];
  }

  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['userId']=userId;
    data['counsellorId'] = counsellorId;
    data['appointmentDate'] = appointmentDate;
    data['appointmentTime']= appointmentTime;
    data['status'] = status;
    return data;
  }

}