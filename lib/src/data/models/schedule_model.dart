class ScheduleModel {
  ScheduleModel({
      this.id, 
      this.classId, 
      this.subjectId, 
      this.day, 
      this.startAt, 
      this.endAt, 
      this.teacherName, 
      this.subject,});

  ScheduleModel.fromJson(dynamic json) {
    id = json['id'];
    classId = json['class_id'];
    subjectId = json['subject_id'];
    day = json['day'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    teacherName = json['teacher_name'];
    subject = json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }
  int? id;
  int? classId;
  int? subjectId;
  String? day;
  String? startAt;
  String? endAt;
  dynamic teacherName;
  Subject? subject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['class_id'] = classId;
    map['subject_id'] = subjectId;
    map['day'] = day;
    map['startAt'] = startAt;
    map['endAt'] = endAt;
    map['teacher_name'] = teacherName;
    if (subject != null) {
      map['subject'] = subject?.toJson();
    }
    return map;
  }

}

class Subject {
  Subject({
      this.id, 
      this.name,});

  Subject.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}