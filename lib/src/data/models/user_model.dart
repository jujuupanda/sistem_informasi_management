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
  dynamic identityNumber;
  dynamic email;
  dynamic address;
  dynamic image;
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
    this.name,});

  Majorclass.fromJson(dynamic json) {
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