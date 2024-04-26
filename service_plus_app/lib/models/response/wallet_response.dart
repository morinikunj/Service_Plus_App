class WalletResponse {
  Wallet? wallet;

  WalletResponse({this.wallet});

  WalletResponse.fromJson(Map<String, dynamic> json) {
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Wallet {
  String? sId;
  String? userId;
  int? balance;
  List<Transactions>? transactions;
  int? iV;

  Wallet({this.sId, this.userId, this.balance, this.transactions, this.iV});

  Wallet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    balance = json['balance'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['balance'] = this.balance;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class Transactions {
  String? type;
  String? description;
  int? amount;
  String? sId;
  String? date;

  Transactions({this.type, this.description, this.amount, this.sId, this.date});

  Transactions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    description = json['description'];
    amount = json['amount'];
    sId = json['_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
    data['date'] = this.date;
    return data;
  }
}
