import 'package:belo_challenge/providers/coins_list_http.dart';
import 'package:belo_challenge/ui/screens/exchange_screen/widgets/selected_coin_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants.dart';

class SelectCoinBottomSheet extends StatelessWidget {
  const SelectCoinBottomSheet({
    Key key,
    @required this.coinSelectedProvider
  }) : super(key: key);

  final StateProvider coinSelectedProvider;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
            child: watch(coinListRequest).when(
              data: (data) {
                List<Widget> list = [];
                for (var coin in data) {
                  list.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SelectedCoinTile(
                      coin: coin,
                      coinSelectedProvider: coinSelectedProvider,
                      ),
                  ));
                }
                return ListView(children: list);
              },
              loading: () => Center(child: const CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
            ));
      },
    );
  }
}