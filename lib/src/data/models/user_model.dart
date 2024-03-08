class UserModel {
  UserModel({
    this.id,
    this.username,
    this.password,
    this.role,
    this.name,
    this.identityNumber,
    this.email,
    this.address,
    this.image,
    this.majorclassId,
    this.majorclass,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    name = json['name'];
    identityNumber = json['identity_number'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    majorclassId = json['majorclass_id'];
    majorclass = json['majorclass'] != null ? Majorclass.fromJson(json['majorclass']) : null;
  }
  int? id;
  String? username;
  String? password;
  String? role;
  String? name;
  String? identityNumber;
  String? email;
  String? address;
  String? image;
  int? majorclassId;
  Majorclass? majorclass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['password'] = password;
    map['role'] = role;
    map['name'] = name;
    map['identity_number'] = identityNumber;
    map['email'] = email;
    map['address'] = address;
    map['image'] = image;
    map['majorclass_id'] = majorclassId;
    if (majorclass != null) {
      map['majorclass'] = majorclass?.toJson();
    }
    return map;
  }

}

class Majorclass {
  Majorclass({
    this.id,
    this.name,
    this.lessons,});

  Majorclass.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['lessons'] != null) {
      lessons = [];
      json['lessons'].forEach((v) {
        lessons?.add(Lessons.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  List<Lessons>? lessons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (lessons != null) {
      map['lessons'] = lessons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Lessons {
  Lessons({
    this.id,
    this.name,
    this.majorclassId,
    this.teacher,
    this.startAt,
    this.endAt,});

  Lessons.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    majorclassId = json['majorclass_id'];
    teacher = json['teacher'];
    startAt = json['startAt'];
    endAt = json['endAt'];
  }
  int? id;
  String? name;
  int? majorclassId;
  String? teacher;
  String? startAt;
  String? endAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['majorclass_id'] = majorclassId;
    map['teacher'] = teacher;
    map['startAt'] = startAt;
    map['endAt'] = endAt;
    return map;
  }

}