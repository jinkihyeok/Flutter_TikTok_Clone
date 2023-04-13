class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final String creatorUid;
  final String creator;
  final int likes;
  final int comments;
  final int createdAt;

  VideoModel({
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.thumbnailUrl,
    required this.creator,
    required this.creatorUid,
    required this.likes,
    required this.comments,
    required this.createdAt,
  });

  VideoModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        fileUrl = json['fileUrl'],
        thumbnailUrl = json['thumbnailUrl'],
        creator = json['creator'],
        creatorUid = json['creatorUid'],
        likes = json['likes'],
        comments = json['comments'],
        createdAt = json['createAt'];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'thumbnailUrl': thumbnailUrl,
      'creator': creator,
      'creatorUid': creatorUid,
      'likes': likes,
      'comments': comments,
      'createAt': createdAt,
    };
  }
}
