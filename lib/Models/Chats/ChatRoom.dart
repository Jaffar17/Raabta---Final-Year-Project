class ChatRoom{
  String id;
  String userId;
  String counsellorId;
  List<Messages>? messages;

  ChatRoom({
    required this.id,
    required this.userId,
    required this.counsellorId,
  });
}

class Messages{
  String id;
  String toId;
  String fromId;
  String message;
  String timestamp;

  Messages({required this.id,
  required this.toId,
  required this.fromId,
  required this.message,
  required this.timestamp});
}