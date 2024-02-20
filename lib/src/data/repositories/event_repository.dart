part of 'repository.dart';

class Event {
  getEventForUser() async {
    final url = Uri.parse("${Repository().baseUrlApp}/event/getEventForUser");
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> result = jsonDecode(response.body)["data"];
        final listEvents = result.map((e) => EventModel.fromJson(e)).toList();
        return listEvents;
      } else {
        List<EventModel> listEvents = [];
        return listEvents;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
