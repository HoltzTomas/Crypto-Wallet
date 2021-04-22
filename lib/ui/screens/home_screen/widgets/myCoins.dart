import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/providers/coins_list_http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_coins_list_tile.dart';

class MyCoins extends ConsumerWidget {
  const MyCoins({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<Coin>> coins = watch(coinListRequest);
    return coins.when(
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
        data: (coins) {
          List<MyCoinListTile> coinsListTiles = [];
          for (var coin in coins) {
            if (coin.howMuchUserOwns > 0.0) {
              coinsListTiles.add(MyCoinListTile(coin: coin));
            }
          }
          return Column(
            children: coinsListTiles,
          );
        });
  }
}
