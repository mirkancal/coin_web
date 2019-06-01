import 'dart:convert';
import 'package:coin_web/model/paribu.dart';
import 'package:http/http.dart' as http;
import 'package:coin_web/model/koineks.dart';

Future<List<Koineks>> fetchKoineks(http.Client client) async {
  final response = await client
      .get('https://cors-anywhere.herokuapp.com/https://koineks.com/ticker');

  return parseKoineks(response.body);
}

Future<List<Paribu>> fetchParibu(http.Client client) async {
  final response = await client
      .get('https://cors-anywhere.herokuapp.com/https://www.paribu.com/ticker');
  return parseParibu(response.body);
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
