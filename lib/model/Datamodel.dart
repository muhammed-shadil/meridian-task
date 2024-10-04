
import 'dart:convert';
class MediaList {
  List<Datamodel> media;

  MediaList({required this.media});

  factory MediaList.fromJson(List<dynamic> jsonList) {
    List<Datamodel> media = jsonList.map((json) => Datamodel.fromJson(json)).toList();
    return MediaList(media: media);
  }

}

class Datamodel {
    int userId;
    int id;
    String title;
    String body;

    Datamodel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
