// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstoe_frontend/widgets/background_image.dart';

import 'package:capstoe_frontend/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // ############ appBar ############ //
        appBar: AppBar(title: Center(child: Text("ProjectName"))),
        // ############ appBar ############ //

        // ############ bottomNavigationBar ############ //

        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Check URL',
            ),
          ],
        ),

        // ############ bottomNavigationBar ############ //
        body: Container(
            width: 400,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                    fit: BoxFit.cover)),
            child: Container(
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
                              backgroundImage: AssetImage(
                                  "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                            ),
                            // ############ 1st Child is avatar############ //

                            // ############ 2nd chid is The username ############ //
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Username",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            // ############ 2nd chid is The username ############ //

                            // ############ 3rd chid is The Title ########### //

                            Padding(
                              padding: const EdgeInsets.only(left: 110),
                              child: Text(
                                "tilte",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            // ############ 3rd chid is The Title ########### //
                          ],
                        ),
                      ),
                      // ############ 1st child in the main column - top Row card ########### //

                      // ############ 2nd child in the main column - Report Details ########### //

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Reference: ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              "MyReference",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            )
                          ],
                        ),
                      ), // ############ Reference

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
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Text(
                                "MyDetails",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Time ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
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
            )));
  }
}
