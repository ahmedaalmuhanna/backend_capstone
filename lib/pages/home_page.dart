import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/providers/reports_provider.dart';
import 'package:capstoe_frontend/widgets/background_image.dart';
import 'package:capstoe_frontend/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 26, 44, 20),
          title: Center(child: Text('Cybersecurity App')),
        ),
        drawer: Drawer(
            child: ListView(
          children: [
            ListTile(
              title: Text('Sign up'),
              trailing: Icon(Icons.login),
              onTap: () {
                context.push("/signup");
              },
            ),
            ListTile(
              title: Text('Sign in'),
              trailing: Icon(Icons.how_to_reg),
              onTap: () {
                context.push("/signin");
              },
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(0, 26, 44, 20),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: Color.fromARGB(235, 0, 85, 255),
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Check URL',
            ),
          ],
        ),
        body: Container(
            width: 400,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                    fit: BoxFit.cover)),
            child: FutureBuilder(
              future: context.read<ReportProvider>().getReportFromService(),
              builder: (((context, snapshot) {
                print("inside the future");
                return ListView.builder(
                    itemCount: context.watch<ReportProvider>().myReport.length,
                    itemBuilder: ((context, index) => MainCard(
                        myReport:
                            context.watch<ReportProvider>().myReport[index])));
              })),
            )));
  }
}
