import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/ui/screens/home_screen/widgets/see_all_coins_list_tile.dart';
import 'package:flutter/material.dart';


class SeeAllCoins extends StatelessWidget {
  const SeeAllCoins({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SeeAllCoinsListTile(coin: Coin(name: "Bitcoin",abreviation: "BTC", price: 57000, dayPriceVariety: 1.3)),
          SeeAllCoinsListTile(coin: Coin(name: "Etherum",abreviation: "ETH", price: 13000, dayPriceVariety: 5.3)),
        ],
      ),
    );
  }
}