// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:capstoe_frontend/models/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MainCard extends StatelessWidget {
  final Report myReport;
  const MainCard({
    Key? key,
    required this.myReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 3),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            color: Colors.white,
            child: Card(
              child: Container(
                // color: Color.fromARGB(255, 0, 26, 44),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 26, 44),
                    border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(myReport.profile.image)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        myReport.profile.username,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(myReport.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 0, 0, 0))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text('Details:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 0, 26, 44))),
          ),
          Container(
            child: Text(myReport.details,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 0, 0, 0))),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            child: Flexible(
              child: InkWell(
                onTap: () {
                  _launchUrl(myReport.reference);
                },
                child: Text('Reference',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 7, 116, 194),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(myReport.time,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 90),
                child: GestureDetector(
                  onTap: () {
                    context.push('/report-details', extra: myReport);
                    print("test");
                  },
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 0, 0, 0),
                          Color.fromARGB(255, 0, 26, 44),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'More Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String myURL) async {
  Uri url = Uri.parse(myURL);
  if (!await launchUrl(url)) {
    throw 'Could not launch $myURL';
  }
}

      // // ############ main card ########### //