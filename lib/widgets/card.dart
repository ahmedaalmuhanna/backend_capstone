import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigCard extends StatelessWidget {
  const BigCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 10,
        child: Column(
          children: [
            Container(
                height: 220,
                width: 250,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                          image:
                              //  NetworkImage(""),
                              AssetImage(
                                  "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        )))),
            Container(
              height: 60,
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dewaan BoFlan",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    // allign the text on the lift
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Every Sunday",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
