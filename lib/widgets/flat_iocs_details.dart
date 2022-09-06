import 'package:capstoe_frontend/models/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/iocs.dart';

class ExpandableIOCSDetails extends StatefulWidget {
  final IOCS iocs;
  const ExpandableIOCSDetails(this.iocs, {Key? key}) : super(key: key);

  @override
  State<ExpandableIOCSDetails> createState() => _ExpandableIOCSDetailsState();
}

class _ExpandableIOCSDetailsState extends State<ExpandableIOCSDetails> {
  late List<ExpansionItem> items;

  @override
  void initState() {
    super.initState();
    items = <ExpansionItem>[
      ExpansionItem(isExpantion: true, header: "CVE", body: widget.iocs.cve),
      ExpansionItem(isExpantion: true, header: "DOMAIN", body: "body2"),
      ExpansionItem(isExpantion: true, header: "Email", body: "body3"),
      ExpansionItem(isExpantion: true, header: "IP", body: "body4"),
      ExpansionItem(isExpantion: true, header: "MD5", body: "body1"),
      ExpansionItem(isExpantion: true, header: "SHA1", body: "body2"),
      ExpansionItem(isExpantion: true, header: "SHA256", body: "body3"),
      ExpansionItem(isExpantion: true, header: "URL", body: "body4"),
    ];
  }

  @override
  Widget build(BuildContext context) => ExpansionPanelList(
      expansionCallback: (int panelIndex, bool isExpanded) {
        setState(() {
          items[panelIndex].isExpantion = !items[panelIndex].isExpantion;
        });
      },
      children: items.map<ExpansionPanel>(
        (ExpansionItem item) {
          return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: ((context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.amberAccent, child: Text(item.header)),
                );
              }),
              body: ListTile(
                title: Container(
                    color: Color.fromARGB(221, 159, 74, 74),
                    child: Text(item.body)),
              ),
              isExpanded: !item.isExpantion);
        },
      ).toList());
}

class ExpansionItem {
  bool isExpantion;
  final String header;
  final String body;
  ExpansionItem({
    required this.isExpantion,
    required this.header,
    required this.body,
  });
}
