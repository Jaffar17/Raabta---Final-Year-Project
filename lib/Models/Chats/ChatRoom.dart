class ChatRoom {
  String? id;
  String? userId;
  String? counsellorId;
  String? userName;
  String? userImage;
  String? counsellorName;
  String? counsellorImage;
  List<Messages>? messages = [];

  ChatRoom({
    this.id,
    this.userId,
    this.counsellorId,
    this.userName,
    this.userImage,
    this.counsellorName,
    this.counsellorImage,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> chatData = {};
    chatData['id'] = this.id;
    chatData['userId'] = this.userId;
    chatData['counsellorId'] = this.counsellorId;
    //new edit
    chatData['userName'] = this.userName;
    chatData['userImage'] = this.userImage;
    chatData['counsellorName'] = this.counsellorName;
    chatData['counsellorImage'] = this.counsellorImage;
    if (this.messages != null) {
      chatData['messages'] = this.messages!.map((e) => e.toJson()).toList();
    }
    return chatData;
  }

  ChatRoom.fromJson(Map<String, dynamic> map){
    id = map['id'];
    userId = map['userId'];
    counsellorId = map['counsellorId'];

    //new edit
    counsellorName = map['counsellorName'];
    counsellorImage = map['counsellorImage'];
    userName = map['userName'];
    userImage = map['userImage'];

    if (map['messages'] != null) {
      messages = <Messages>[];
      map['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }


  @override
  String toString() {
    return 'ChatRoom{id: $id, userId: $userId, counsellorId: $counsellorId, userName: $userName, userImage: $userImage, counsellorName: $counsellorName, counsellorImage: $counsellorImage, messages: $messages}';
  }
}
  class Messages {
  int ? id;
  String ?toId;
  String ?fromId;
  String ?message;


  Messages({
    required this.id,
    required this.toId,
    required this.fromId,
    required this.message,
  });

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> messageData={};
    messageData['id']= this.id;
    messageData['toId']=this.toId;
    messageData['fromId']= this.fromId;
    messageData['message']=this.message;

    return messageData;
  }

  Messages.fromJson(Map<String,dynamic>map)
  {

    id = map['id'];
    toId = map['toId'];
    fromId = map['fromId'];
    message = map['message'];

  }
}