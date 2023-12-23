class Comment {
  String? username;
  String? comment;
  DateTime? date;

  Comment({this.username, this.comment, this.date});

  Map<String, dynamic> toJson() => {
        "username": username,
        "comment": comment,
        "date": date?.toIso8601String(),
      };
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        username: json["username"],
        comment: json["comment"],
        date: DateTime.parse(json['date']));
  }
}
