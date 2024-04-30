class UserProfileResponse {
  String? sId;
  String? name;
  String? email;
  String? profileImg;
  String? mobileNo;
  List<Addresses>? addresses;
  int? iV;

  UserProfileResponse(
      {this.sId,
      this.name,
      this.email,
      this.profileImg,
      this.mobileNo,
      this.addresses,
      this.iV});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    profileImg = json['profileImg'];
    mobileNo = json['mobileNo'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    } else {
      addresses = [];
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['profileImg'] = profileImg;
    data['mobileNo'] = mobileNo;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Addresses {
  String? title;
  String? addressLine;
  String? sId;

  Addresses({this.title, this.addressLine, this.sId});

  Addresses.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    addressLine = json['addressLine'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['addressLine'] = addressLine;
    data['_id'] = sId;
    return data;
  }
}
