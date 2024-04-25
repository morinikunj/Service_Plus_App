class ServiceProviderProfileDetails {
  Charge? charge;
  String? sId;
  String? name;
  String? email;
  String? phoneNumber;
  String? service;
  String? serviceLocation;
  String? image;
  int? iV;
  int? averageRating;
  List<Ratings>? ratings;

  ServiceProviderProfileDetails(
      {this.charge,
      this.sId,
      this.name,
      this.email,
      this.phoneNumber,
      this.service,
      this.serviceLocation,
      this.image,
      this.iV,
      this.averageRating,
      this.ratings});

  ServiceProviderProfileDetails.fromJson(Map<String, dynamic> json) {
    charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    service = json['service'];
    serviceLocation = json['serviceLocation'];
    image = json['image'];
    iV = json['__v'];
    averageRating = json['averageRating'];
    if (json['ratings'] != null) {
      ratings = <Ratings>[];
      json['ratings'].forEach((v) {
        ratings!.add(Ratings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (charge != null) {
      data['charge'] = charge!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['service'] = service;
    data['serviceLocation'] = serviceLocation;
    data['image'] = image;
    data['__v'] = iV;
    data['averageRating'] = averageRating;
    if (ratings != null) {
      data['ratings'] = ratings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Charge {
  int? amount;
  String? per;

  Charge({this.amount, this.per});

  Charge.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    per = json['per'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['per'] = per;
    return data;
  }
}

class Ratings {
  int? rating;
  String? comment;
  String? userName;
  String? userImage;
  String? sId;

  Ratings({this.rating, this.comment, this.userName, this.userImage, this.sId});

  Ratings.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    userName = json['userName'];
    userImage = json['userImage'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['userName'] = userName;
    data['userImage'] = userImage;
    data['_id'] = sId;
    return data;
  }
}
