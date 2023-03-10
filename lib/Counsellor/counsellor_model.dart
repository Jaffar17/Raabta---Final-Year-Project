class Counsellor{
  double id;
  String? displayName;
  String? email;
  String? photoUrl;

  Counsellor({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  Counsellor fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    return (Counsellor(
        id: id,
        displayName: displayName,
        email: email,
        photoUrl: photoUrl
    ));
  }

  Map <String, dynamic> toJson()
  {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['displayName']=displayName;
    data['photoUrl'] = photoUrl;
    data['email'] = email;
    return data;
  }

}