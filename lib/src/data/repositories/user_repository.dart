part of 'repository.dart';

class User {
  late String error;

  getUser(
    String username,
    String token,
  ) async {
    final url = Uri.parse("${Repository().baseUrlApp}/user/getUser/$username");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body)["data"];
      return UserModel.fromJson(result);
    } else {
      return null;
    }
  }

  addUser(
    String username,
    String password,
    String name,
    String role,
  ) async {
    error = "";
    final url = Uri.parse("${Repository().baseUrlApp}/user/createUser");
    final response = await http.post(
      url,
      body: {
        "username": username,
        "password": password,
        "name": name,
        "role": role
      },
    );
    final result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return null;
    } else {
      return error = result["message"];
    }
  }

  ///Major Class Lesson
// getMajorLesson(
//   int majorId,
//   String token,
// ) async {
//   final url =
//       Uri.parse("${Repository().baseUrlApp}/user/getMajorClass/$majorId");
//   try {
//     final response = await http.get(
//       url,
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": token,
//       },
//     );
//     if (response.statusCode == 200) {
//       final result = jsonDecode(response.body)["data"];
//       return MajorClassLessonModel.fromJson(result);
//     } else {}
//   } catch (error) {
//     throw Exception(error);
//   }
// }
}
