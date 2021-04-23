import 'package:belo_challenge/constants.dart';
import 'package:belo_challenge/models/Coin.dart';
import 'package:belo_challenge/ui/screens/swap_screen/widgets/select_coin_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinSelected = StateProvider<Coin>((ref) => null);

class SendScreen extends StatefulWidget {
  @override
  _SendScreenState createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Row(
            children: [
              //"How much are you going to send?" TextField
              Expanded(
                flex: 3,
                child: Consumer(
                  builder: (context, watch, child) {
                    return Container(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "You send (Ex: 35.1)",
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              //Coin Image
              Expanded(
                  flex: 1,
                  child: Consumer(
                    builder: (context, watch, child) {
                      if (watch(coinSelected).state == null) {
                        return Text("Select a Coin");
                      } else {
                        return Container(
                          child: Image.network(watch(coinSelected).state.imageUrl),
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        //"Wallet's direccion" Text Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Wallet Direction",
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding / 2),
        //Submit and Select Coin buttons
        Container(
            margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    child: Text("Send",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kAccentColor)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    child: Text("Select Coin",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kAccentColor)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (builder) {
                            return SelectCoinBottomSheet();
                          });
                    },
                  ),
                )
              ],
            )),
      ],
    );
  }
}



