class Recipe {
  String? title;
  String? type;
  String? photo;
  String? calories;
  String? time;
  String? description;
  // bool? bookmark;
  // String? userId;

  List<ListBookmark> listBookmark;
  List<Ingridient> ingridients;
  List<TutorialStep> tutorial;
  List<Review> reviews;

  Recipe(
      {this.title,
      this.type,
      this.photo,
      this.calories,
      this.time,
      this.description,
      // this.bookmark,
      required this.listBookmark,
      required this.reviews,
      required this.tutorial,
      required this.ingridients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json["title"],
      type: json["type"],
      photo: json["photo"],
      calories: json["calories"],
      time: json["time"],
      description: json["description"],
      // bookmark: json['bookmark'],
      // userId: json['userId'],
      listBookmark: List.from(json["listBookmark"])
          .map((e) => ListBookmark.fromJson(e))
          .toList(),
      tutorial: List.from(json["tutorial"])
          .map((e) => TutorialStep.fromJson(e))
          .toList(),
      ingridients: List.from(json["ingridients"])
          .map((e) => Ingridient.fromJson(e))
          .toList(),
      reviews:
          List.from(json["reviews"]).map((e) => Review.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['photo'] = photo;
    data['calories'] = calories;
    data['time'] = time;
    data['description'] = description;
    // data['bookmark'] = bookmark;
    // data['userId'] = userId;
    data['listBookmark'] = listBookmark.map((e) => e.toMap()).toList();
    data['reviews'] = reviews.map((e) => e.toMap()).toList();
    data['tutorial'] = tutorial.map((e) => e.toMap()).toList();
    data['ingridients'] = ingridients.map((e) => e.toMap()).toList();
    return data;
  }
}

class TutorialStep {
  String? step;
  String? description;
  TutorialStep({this.step, this.description});

  Map<String, dynamic> toMap() {
    return {
      'step': step,
      'description': description,
    };
  }

  factory TutorialStep.fromJson(Map<String, dynamic> json) {
    return TutorialStep(step: json["step"], description: json["description"]);
  }

  static List<TutorialStep> toList(List<Map<String, dynamic>> json) {
    return List.from(json)
        .map(
            (e) => TutorialStep(step: e["step"], description: e["description"]))
        .toList();
  }
}

//review foods
class Review {
  String? id;
  String? username;
  String? userId;
  String? review;
  String? date;
  String? type;
  String? foodId;

  Review({
    this.id,
    this.username,
    this.userId,
    this.review,
    this.date,
    this.type,
    this.foodId,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        username: json['username'],
        userId: json['userId'],
        review: json['review'],
        date: json['date'],
        type: json['type'],
        foodId: json['foodId'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'userId': userId,
      'review': review,
      'date': date,
      'type': type,
      'foodId': foodId,
    };
  }

  static List<Review> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Review(
              id: e['id'],
              username: e['username'],
              userId: e['userId'],
              review: e['review'],
              date: e['date'],
              type: e['type'],
              foodId: e['foodId'],
            ))
        .toList();
  }
}

//Nguyen lieu
class Ingridient {
  String? name;
  String? size;

  Ingridient({this.name, this.size});
  factory Ingridient.fromJson(Map<String, dynamic> json) => Ingridient(
        name: json['name'],
        size: json['size'],
      );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'size': size,
    };
  }

  static List<Ingridient> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => Ingridient(name: e['name'], size: e['size']))
        .toList();
  }
}

class ListBookmark {
  String? userId;
  bool? bookmark;

  ListBookmark({this.userId, this.bookmark});
  factory ListBookmark.fromJson(Map<String, dynamic> json) => ListBookmark(
        userId: json['userId'],
        bookmark: json['bookmark'],
      );

  Map<String, dynamic> toMap() {
    return {'userId': userId, 'bookmark': bookmark};
  }

  static List<ListBookmark> toList(List<Map<String, Object>> json) {
    return List.from(json)
        .map((e) => ListBookmark(userId: e['userId'], bookmark: e['bookmark']))
        .toList();
  }
}
