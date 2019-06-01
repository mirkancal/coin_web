class Koineks {
  String shortCode;
  String name;
  String currency;
  String open;
  String current;
  String changeAmount;
  String changePercentage;
  String high;
  String low;
  String volume;
  String ask;
  String bid;
  int timestamp;

  Koineks(
      {this.shortCode,
      this.name,
      this.currency,
      this.open,
      this.current,
      this.changeAmount,
      this.changePercentage,
      this.high,
      this.low,
      this.volume,
      this.ask,
      this.bid,
      this.timestamp});

  Koineks.fromJson(Map<String, dynamic> json) {
    shortCode = json['short_code'];
    name = json['name'];
    currency = json['currency'];
    open = json['open'];
    current = json['current'];
    changeAmount = json['change_amount'];
    changePercentage = json['change_percentage'];
    high = json['high'];
    low = json['low'];
    volume = json['volume'];
    ask = json['ask'];
    bid = json['bid'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_code'] = this.shortCode;
    data['name'] = this.name;
    data['currency'] = this.currency;
    data['open'] = this.open;
    data['current'] = this.current;
    data['change_amount'] = this.changeAmount;
    data['change_percentage'] = this.changePercentage;
    data['high'] = this.high;
    data['low'] = this.low;
    data['volume'] = this.volume;
    data['ask'] = this.ask;
    data['bid'] = this.bid;
    data['timestamp'] = this.timestamp;
    return data;
  }
}