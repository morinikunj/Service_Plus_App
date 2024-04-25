class WalletResponse {
  String? id;
  int? balance;
  List<Transactions>? transactions;

  WalletResponse({this.id, this.balance, this.transactions});

  WalletResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['balance'] = balance;
    if (transactions != null) {
      data['transactions'] = transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? type;
  String? description;
  int? amount;
  String? recipient;
  String? sId;
  String? date;

  Transactions(
      {this.type,
      this.description,
      this.amount,
      this.recipient,
      this.sId,
      this.date});

  Transactions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    description = json['description'];
    amount = json['amount'];
    recipient = json['recipient'];
    sId = json['_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['description'] = description;
    data['amount'] = amount;
    data['recipient'] = recipient;
    data['_id'] = sId;
    data['date'] = date;
    return data;
  }
}
