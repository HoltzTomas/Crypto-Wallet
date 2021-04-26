import 'package:belo_challenge/models/Coin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userCoinsList = StateProvider<List<Coin>>((ref) => []);
