// import 'dart:convert';

// UserModel UserModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// String UserModelToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//   int userId;
//   int id;
//   String title;
//   bool completed;

//   UserModel({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.completed,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         completed: json["completed"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "completed": completed,
//       };
// }
class TodoModel {
  final int id;
  final String title;
  final bool completed;

  TodoModel({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
