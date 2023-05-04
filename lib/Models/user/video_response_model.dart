class VideoResponse {
  final String ?userId;
  final String ?videoLink;
  final Map<String, dynamic> ?emotions;

  VideoResponse({this.userId,  this.videoLink, this.emotions});

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    return VideoResponse(
      userId: json['user-id'],
      videoLink : json['video-link'],
      emotions: json['emotions'],
    );
  }

  Map<String, dynamic> toJson() => {
    'user-id': userId,
    'video-link': videoLink,
    'emotions': emotions,
  };

  @override
  String toString() {
    return 'VideoResponse{userId: $userId, videoLink: $videoLink, emotions: $emotions}';
    }
}