// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_interpolation_to_compose_strings
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';
import 'package:capstoe_frontend/providers/reports_provider.dart';
// import 'package:capstoe_frontend/widgets/background_image.dart';
import 'package:capstoe_frontend/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int myindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // ############ appBar ############ //

        // ############ appBar ############ //

        // ############ bottomNavigationBar ############ //

        // ############ bottomNavigationBar ############ //
        body: Container(
      width: 400,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
              fit: BoxFit.cover)),
      child: context.watch<ReportProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: context.watch<ReportProvider>().reports.length,
              itemBuilder: ((context, index) => MainCard(
                  myReport: context.watch<ReportProvider>().reports[index]))),
    ));
  }
}
