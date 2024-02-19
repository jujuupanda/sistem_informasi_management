part of 'repository.dart';

class Auth {
  late String token;
  late String error;

  login(String username, String password) async {
    token = "";
    error = "";
    final url = Uri.parse("${Repository().baseUrlApp}/auth/login");
    final response = await http
        .post(url, body: {"username": username, "password": password});
    final result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      //Token
      return token = result['data'];
    } else {
      //Error Login
      return error = result['message'];
    }
  }

  decodedJWT(String token) {
    Map<String, dynamic> userInfo = JwtDecoder.decode(token);
    return userInfo;
  }

  register() {}
}
