import 'package:belo_challenge/ui/screens/swap_screen/widgets/operation_buttons.dart';
import 'package:belo_challenge/ui/widgets/screen_title.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SwapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: kDefaultPadding * 1.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
                    child: Row(
                      children: [
                        ScreenTitle(title: "Swap"),
                        Spacer(),                        
                      ],
                    ),
                  ),
                ],
              ),
                  OperationButtons()
            ],
          ),
        ),
      ),
    );
  }
}

