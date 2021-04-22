import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/providers/coins_list_http.dart';
import 'package:belo_challenge/ui/screens/home_screen/widgets/see_all_coins_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SeeAllCoins extends ConsumerWidget {
  const SeeAllCoins({Key key}) : super(key: key);

 @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<List<Coin>> coins = watch(coinListRequest);
    return coins.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (coins) {
        List<SeeAllCoinsListTile> coinsListTiles = [];
        for (var coin in coins) {
          coinsListTiles.add(SeeAllCoinsListTile(
            coin: coin
          ));
        }
        return Column(
          children: coinsListTiles,
        );
      }
    );
  }
}