import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
part 'auth_repository.dart';

class Repository {
  final baseUrlApp = "http://172.16.4.132:4000";

  final auth = Auth();
}