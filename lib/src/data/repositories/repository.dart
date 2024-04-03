import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sistem_informasi_sekolah/src/data/models/schedule_model.dart';


import '../models/event_model.dart';
import '../models/user_model.dart';
part 'auth_repository.dart';
part 'event_repository.dart';
part 'user_repository.dart';
part 'schedule_repository.dart';

class Repository {
  final baseUrlApp = "http://172.16.2.254:4000";

  final auth = Auth();
  final event = Event();
  final user = User();
  final schedule = Schedule();
}