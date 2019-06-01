class Paribu {
  String shortCode;
  String lowestAsk;
  String highestBid;
  String low24hr;
  String high24hr;
  String avg24hr;
  String volume;
  String current;
  String change;
  String percentChange;
  List<double> chartData;

  Paribu(
      {this.shortCode,
      this.lowestAsk,
      this.highestBid,
      this.low24hr,
      this.high24hr,
      this.avg24hr,
      this.volume,
      this.current,
      this.change,
      this.percentChange,
      this.chartData});

  Paribu.fromJson(Map<String, dynamic> json) {
    shortCode = json['shortCode'];
    lowestAsk = json['lowestAsk'].toString();
    highestBid = json['highestBid'].toString();
    low24hr = json['low24hr'].toString();
    high24hr = json['high24hr'].toString();
    avg24hr = json['avg24hr'].toString();
    volume = json['volume'].toString();
    current = json['last'].toString();
    change = json['change'].toString();
    percentChange = json['percentChange'].toString();
    chartData = json['chartData'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lowestAsk'] = this.lowestAsk;
    data['highestBid'] = this.highestBid;
    data['low24hr'] = this.low24hr;
    data['high24hr'] = this.high24hr;
    data['avg24hr'] = this.avg24hr;
    data['volume'] = this.volume;
    data['last'] = this.current;
    data['change'] = this.change;
    data['percentChange'] = this.percentChange;
    data['chartData'] = this.chartData;
    return data;
  }
}
