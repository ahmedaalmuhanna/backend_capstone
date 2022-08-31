// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:capstoe_frontend/models/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final Report myReport;
  const MainCard({
    Key? key,
    required this.myReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // card container
      // color: Colors.amber,
      // width: 500,
      height: 260,
      margin: EdgeInsets.all(20),

      child: Card(
        // ############ main card ########### //
        child: Container(
          child: Column(
            // ############ main column ########### //
            children: [
              // ############ 1st child in the main column - top Row card ########### //
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ############ 1st Child is avatar############ //
                    CircleAvatar(
                        backgroundImage: NetworkImage(myReport.profile.image)

                        //  AssetImage(
                        //     "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                        ),
                    // ############ 1st Child is avatar############ //

                    // ############ 2nd chid is The username ############ //
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        myReport.profile.username,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    // ############ 2nd chid is The username ############ //

                    // ############ 3rd chid is The Title ########### //

                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Text(
                        myReport.title,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    // ############ 3rd chid is The Title ########### //
                  ],
                ),
              ),
              // ############ 1st child in the main column - top Row card ########### //

              // ############ 2nd child in the main column - Report Details ########### //

              // ############ Details
              Container(
                width: 365,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details: ",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        myReport.details,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 51),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Reference: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Flexible(
                              child: Text(
                                myReport.reference,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                maxLines: 1,
                              ),
                            )
                          ],
                        ),
                      ), // ############ Reference
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      myReport.time,
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    InkWell(
                      child: Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 50, 113, 163),
                      ),
                      onTap: () {
                        print("test");
                      },
                    ),
                    InkWell(
                      child: Icon(
                        Icons.share,
                        color: Color.fromARGB(255, 50, 113, 163),
                      ),
                      onTap: () {
                        print("test");
                      },
                    ),
                  ],
                ),
              )

              // ############ Details

              // ############ 2nd child in the main column - Report Details ########### //
            ],
          ),
        ),
      ),
      // ############ main card ########### //
    );
  }
}
