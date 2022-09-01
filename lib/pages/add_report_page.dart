// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstoe_frontend/widgets/input_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({Key? key}) : super(key: key);

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  int myindex = 1;
  // Report details

  final referenceController = TextEditingController();
  final detailsController = TextEditingController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  // IOCSController
  final cveController = TextEditingController();
  final urlController = TextEditingController();
  final domainController = TextEditingController();
  final ipController = TextEditingController();
  final md5Controller = TextEditingController();
  final sha1Controller = TextEditingController();
  final sha256Controller = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ############ appBar ############ //
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 26, 44, 20),
        title: Text('Cybersecurity App'),
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
      // ############ appBar ############ //

      body: Center(
          child: Container(
              width: 400,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  // final detailsController = TextEditingController();
                  // final titleController = TextEditingController();
                  // final timeController = TextEditingController();
                  // // IOCSController
                  // final cveController = TextEditingController();
                  // final urlController = TextEditingController();
                  // final domainController = TextEditingController();
                  // final ipController = TextEditingController();
                  // final md5Controller = TextEditingController();
                  // final sha1Controller = TextEditingController();
                  // final sha256Controller = TextEditingController();
                  // final emailController = TextEditingController();
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        minLines: 20,
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: "hintText",
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 26, 44),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Reference",
                          myController: referenceController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Title", myController: titleController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: inputTextField(
                          hintText: "Details", myController: detailsController),
                    ),
                  ],
                ),
              ))),

      // ############ bottomNavigationBar ############ //

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(0, 26, 44, 20),
        onTap: (index) {
          if (index == 0) {
            context.go("/");
            setState(() {
              myindex = index;
            });
          }
          if (index == 1) {
            context.go("/adding-report");
            setState(() {
              myindex = index;
            });
          }
        },
        currentIndex: myindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Check URL',
          ),
        ],
      ),

      // ############ bottomNavigationBar ############ //
    );
  }
}
