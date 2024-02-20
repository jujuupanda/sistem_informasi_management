class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.password, 
      this.role, 
      this.nisn, 
      this.name, 
      this.email, 
      this.address,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    nisn = json['nisn'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
  }
  int? id;
  String? username;
  String? password;
  String? role;
  dynamic nisn;
  String? name;
  dynamic email;
  dynamic address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['password'] = password;
    map['role'] = role;
    map['nisn'] = nisn;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    return map;
  }

}