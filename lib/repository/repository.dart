import 'dart:convert';
import 'package:coin_web/model/paribu.dart';
import 'package:http/http.dart' as http;
import 'package:coin_web/model/koineks.dart';

class Repository {
  final http.Client client = http.Client();

  Future<List<Koineks>> fetchKoineks() async {
    final response = await client
        .get('https://cors-anywhere.herokuapp.com/https://koineks.com/ticker');
    if (response.statusCode == 200) {
      return parseKoineks(response.body);
    }
    throw CoinApiError("Koineks API couldn't be fetched");
  }

  Future<List<Paribu>> fetchParibu() async {
    final response = await client.get(
        'https://cors-anywhere.herokuapp.com/https://www.paribu.com/ticker');
    if (response.statusCode == 200) {
      return parseParibu(response.body);
    }
    throw CoinApiError("Paribu API couldn't be fetched");
  }

  List<Koineks> parseKoineks(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;

    return parsed.keys
        .map<Koineks>((coin) => Koineks.fromJson(parsed[coin]))
        .toList();
  }

  List<Paribu> parseParibu(String responseBody) {
    final Map<String, dynamic> parsed =
        jsonDecode(responseBody) as Map<String, dynamic>;

    return parsed.keys.map<Paribu>((coin) {
      parsed[coin]['shortCode'] = coin.split('_').first;
      return Paribu.fromJson(parsed[coin]);
    }).toList();
  }
}

class CoinApiError extends Error {
  CoinApiError(this.message);
  final String message;
}
