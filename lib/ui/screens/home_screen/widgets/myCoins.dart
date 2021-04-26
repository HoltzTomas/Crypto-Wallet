import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/providers/user_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_coins_list_tile.dart';

class MyCoins extends ConsumerWidget {
  const MyCoins({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    List<Coin> coins = watch(userCoinsList).state;
    List<MyCoinListTile> myCoinsList = [];
    for (var coin in coins) {
      myCoinsList.add(MyCoinListTile(coin: coin));
    }
    if (coins.isEmpty) {
      return Column(
        children: [
          SizedBox(height: kDefaultPadding),
          Center(child: Text("No tienes monedas aun! Compra ya!")),
        ],
      );
    } else {
      return Column(
        children: myCoinsList,
      );
    }
  }
}
