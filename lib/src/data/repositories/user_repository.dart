part of 'repository.dart';

class User {
  getUser(String username, String role, String token) async {
    final url =
        Uri.parse("${Repository().baseUrlApp}/user/getUser/$username").replace(
      queryParameters: {
        "role": role,
      },
    );
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
}
