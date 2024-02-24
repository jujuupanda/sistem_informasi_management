class UserModel {
  UserModel({
      this.id, 
      this.username, 
      this.password, 
      this.role, 
      this.nisn, 
      this.name, 
      this.email, 
      this.address,
      this.classes,
      this.image,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    nisn = json['nisn'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    classes = json['class'];
    image = json['image'];
  }
  int? id;
  String? username;
  String? password;
  String? role;
  String? nisn;
  String? name;
  String? email;
  String? address;
  String? classes;
  String? image;

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
    map['classes'] = classes;
    map['image'] = image;
    return map;
  }

}