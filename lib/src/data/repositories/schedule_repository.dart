part of 'repository.dart';

class Schedule {
  getSchedule(
    int classId,
    String token,
  ) async {
    final url =
        Uri.parse("${Repository().baseUrlApp}/schedule/getSchedule/$classId");
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );
    try {
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body)["data"];
        final listSchedule =
            result.map((e) => ScheduleModel.fromJson(e)).toList();
        return listSchedule;
      } else {
        List<ScheduleModel> listSchedule = [];
        return listSchedule;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
