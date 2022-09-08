// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstoe_frontend/pages/add_report_page.dart';
import 'package:capstoe_frontend/pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 26, 44, 20),
        title: Text('Cybersecurity App'),
      ),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 0, 26, 44),
          child: Consumer<AuthProvider>(
              builder: ((context, auth, child) => ListView(
                    children: context.read<AuthProvider>().user == null
                        ? []
                        : [
                            UserAccountsDrawerHeader(
                                accountName: Text(
                                    "Welcome " +
                                        context
                                            .read<AuthProvider>()
                                            .user!
                                            .username +
                                        " .. ",
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 48, 137, 201))), //Username

                                currentAccountPicture: CircleAvatar(
                                  child: ClipOval(
                                      child: Image.network(
                                    context.read<AuthProvider>().user!.image,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://static.vecteezy.com/system/resources/previews/000/690/000/original/blue-binary-cyber-circuit-future-technology-concept-background-vector.jpg"),
                                        fit: BoxFit.cover)),
                                accountEmail: Text(
                                    context.read<AuthProvider>().user!.bio)),
                            ListTile(
                              title: Text('Profile',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              trailing: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              onTap: () {
                                context.push('/profile');
                              },
                            ),
                            ListTile(
                              title: Text(
                                'Logout',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              trailing: Icon(
                                Icons.login,
                                color: Colors.white,
                              ),
                              onTap: () async {
                                context.read<AuthProvider>().logout();
                                print(await context
                                    .read<AuthProvider>()
                                    .user!
                                    .username);
                                // context.go("/");

                                context.replace('/');
                              },
                            ),
                          ],
                  )))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.index,
        onTap: (i) => setState(() => controller.index = i),
        backgroundColor: Color.fromRGBO(0, 26, 44, 20),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            label: 'Add',
          ),
        ],
      ),
      body: TabBarView(controller: controller, children: [
        ListPage(),
        AddReportPage(onSubmit: () {
          setState(() {
            controller.index = 0;
          });
        }),
      ]),
    );
  }
}
