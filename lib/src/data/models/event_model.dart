class EventModel {
  EventModel({
      this.id, 
      this.eventName, 
      this.author, 
      this.date, 
      this.eventData,});

  EventModel.fromJson(dynamic json) {
    id = json['id'];
    eventName = json['event_name'];
    author = json['author'];
    date = json['date'];
    eventData = json['event_data'];
  }
  int? id;
  String? eventName;
  String? author;
  String? date;
  String? eventData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['event_name'] = eventName;
    map['author'] = author;
    map['date'] = date;
    map['event_data'] = eventData;
    return map;
  }

}