import 'dart:convert';
import 'package:belo_challenge/models/Coin.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';


final coinListRequest = StreamProvider<List<Coin>>((ref) async*{

  final response = await http.get(Uri.parse(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=ars&order=market_cap_desc&per_page=100&page=1&sparkline=false"));
      

  List<Coin> coinsList = [];

  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);  

    final jsonData = jsonDecode(body);

    for (var coin in jsonData) {
      coinsList.add(Coin(
          name: coin["id"],
          abreviation: coin["symbol"],
          price: coin["current_price"],
          dayPriceVariety: coin["price_change_percentage_24h"],
          imageUrl: coin["image"],
          howMuchUserOwns: 0.0));
    }

    yield coinsList;
  } else {
    throw Exception("Error al buscar informacion de criptomonedas");
  }
});


