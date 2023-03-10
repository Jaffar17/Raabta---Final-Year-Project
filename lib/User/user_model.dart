class UserModel{
  double id;
  String? displayName;
  String? email;
  String? photoUrl;

  UserModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  UserModel fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    return (UserModel(
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