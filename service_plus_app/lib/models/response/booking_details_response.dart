class BookingDetailsResponse {
  String? sId;
  String? serviceProviderId;
  String? userId;
  String? serviceProviderName;
  String? userName;
  String? service;
  String? bookingDate;
  String? bookingTime;
  String? status;
  Charge? charge;
  String? address;
  String? createdAt;
  int? iV;

  BookingDetailsResponse(
      {this.sId,
      this.serviceProviderId,
      this.userId,
      this.serviceProviderName,
      this.userName,
      this.service,
      this.bookingDate,
      this.bookingTime,
      this.status,
      this.charge,
      this.address,
      this.createdAt,
      this.iV});

  BookingDetailsResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    serviceProviderId = json['serviceProviderId'];
    userId = json['userId'];
    serviceProviderName = json['serviceProviderName'];
    userName = json['userName'];
    service = json['service'];
    bookingDate = json['bookingDate'];
    bookingTime = json['bookingTime'];
    status = json['status'];
    charge =
        json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    address = json['address'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['serviceProviderId'] = serviceProviderId;
    data['userId'] = userId;
    data['serviceProviderName'] = serviceProviderName;
    data['userName'] = userName;
    data['service'] = service;
    data['bookingDate'] = bookingDate;
    data['bookingTime'] = bookingTime;
    data['status'] = status;
    if (charge != null) {
      data['charge'] = charge!.toJson();
    }
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}

class Charge {
  int? amount;
  String? per;
  String? sId;

  Charge({this.amount, this.per, this.sId});

  Charge.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    per = json['per'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['amount'] = amount;
    data['per'] = per;
    data['_id'] = sId;
    return data;
  }
}