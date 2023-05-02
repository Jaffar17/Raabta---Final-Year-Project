class Notes {
  int? id;
  String? Date;
  String? note;
  String? patientName;

  Notes({this.id, this.Date, this.patientName, this.note});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['patientName'] = this.patientName;
    data['Date'] = this.Date;
    data['note'] = this.note;
    return data;
  }

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    Date = json["Date"];
    note = json['note'];
    patientName = json['patientName'];
  }
}
