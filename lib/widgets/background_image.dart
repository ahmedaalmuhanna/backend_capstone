import 'package:capstoe_frontend/widgets/main_card.dart';
import 'package:flutter/cupertino.dart';

class Background_image extends StatelessWidget {
  const Background_image({
    Key? key,
    required this.myWidget,
  }) : super(key: key);

  final MainCard myWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                fit: BoxFit.cover)),
        child: myWidget);
  }
}
