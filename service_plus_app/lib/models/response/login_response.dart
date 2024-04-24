class UserResponse {
  String? token;
  String? sId;
  String? name;
  String? email;
  String? password;
  String? type;
  int? iV;

  UserResponse(
      {this.token,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.type,
      this.iV});

  UserResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    data['__v'] = iV;
    return data;
  }
}
