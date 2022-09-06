// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:capstoe_frontend/models/iocs.dart';
import 'package:capstoe_frontend/models/profile.dart';
import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/providers/reports_provider.dart';
import 'package:capstoe_frontend/widgets/input_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({Key? key}) : super(key: key);

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  int myindex = 1;

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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: titleController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Tilte',
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
                      child: TextFormField(
                        controller: referenceController,
                        style: TextStyle(color: Colors.white),
                        minLines: 2, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Reference',
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
                      child: TextFormField(
                        controller: detailsController,
                        style: TextStyle(color: Colors.white),
                        minLines: 10,
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Details',
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
                    Center(
                      child: Text(
                        'IOCs',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: domainController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Domain',
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
                      child: TextFormField(
                        controller: ipController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'IP',
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
                      child: TextFormField(
                        controller: md5Controller,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'MD5',
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
                      child: TextFormField(
                        controller: sha1Controller,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'SHA1',
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
                      child: TextFormField(
                        controller: sha256Controller,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'SHA256',
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
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'Email',
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
                      child: TextFormField(
                        controller: urlController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'URL',
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
                      child: TextFormField(
                        controller: cveController,
                        style: TextStyle(color: Colors.white),
                        minLines: 1, ///////
                        maxLines: 40,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          hintText: 'CVE',
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
                    ElevatedButton(
                        onPressed: () async {
                          await context.read<ReportProvider>().addReport(
                                details: detailsController.text,
                                title: titleController.text,
                                reference: referenceController.text,
                                cve: cveController.text,
                                domain: domainController.text,
                                email: emailController.text,
                                ip: ipController.text,
                                md5: md5Controller.text,
                                sha1: sha1Controller.text,
                                sha256: sha1Controller.text,
                                url: urlController.text,
                              );

                          print("test");
                          context.go('/homepage');
                        },
                        child: Text("SUBMIT"))
                  ],
                ),
              ))),

      // ############ bottomNavigationBar ############ //

      // ############ bottomNavigationBar ############ //
    );
  }
}
