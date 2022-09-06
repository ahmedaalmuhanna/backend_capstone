// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:capstoe_frontend/models/iocs.dart';
import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/widgets/expandable_IOCS_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportDetailsPage extends StatefulWidget {
  final Report myReport;
  const ReportDetailsPage({
    Key? key,
    required this.myReport,
  }) : super(key: key);

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage> {
  // late Report myReport;

  @override
  Widget build(BuildContext context) {
    String myData = widget.myReport.iocs.cve;

    return Scaffold(

        // ############ appBar ############ //
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 26, 44, 20),
          title: Center(
              child: Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30.0,
            ),
          )),
        ),

        // ############ appBar ############ //
        body: Container(
            width: 400,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IOCs_Card(
                  report: widget.myReport,
                ))));
  }
}

class IOCs_Card extends StatelessWidget {
  const IOCs_Card({
    Key? key,
    required this.report,
  }) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              report.title,
              style: TextStyle(
                  fontSize: 40.0, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Details',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20.0),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Flexible(
              child: Text(
                report.details,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                // maxLines: 8,
              ),
              // ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Reference',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //   child: Flexible(
              child: InkWell(
                onTap: () {
                  _launchUrl(report.reference);
                },
                child: Text(report.reference,
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
            //   ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'IOCs',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'CVE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.cve,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(240, 240, 240, 100),
                ),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'URL',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.url,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromRGBO(240, 240, 240, 100),
                ),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Domain',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.domain,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'IP',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.ip,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'MD5',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.md5,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255)),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Sha1',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.sha1,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Sha256',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.cve,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                maxLines: 3,
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            'Email',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 26, 44),
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 23, 61, 87),
                  Color.fromARGB(255, 1, 17, 28)
                ]),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 4, 16, 24),
                      blurRadius: 2.0,
                      offset: Offset(2.0, 2.0))
                ]),

            //
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                report.iocs.email,
                style: TextStyle(
                    fontSize: 20.0, color: Color.fromRGBO(240, 240, 240, 100)),
                maxLines: 3,
              ),
            ),
          ),
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
