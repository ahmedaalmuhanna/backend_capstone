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

  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: titleController,
                          validator: (titleController) {
                            if (titleController!.isEmpty) {
                              return "Please fill out the title field";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'Type Your Report Title ..',
                            labelText: 'Title ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (referenceController) {
                            if (referenceController!.isEmpty) {
                              return "Please fill out the reference field";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'Type Your Report Reference ..',
                            labelText: 'Reference ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (detailsController) {
                            if (detailsController!.isEmpty) {
                              return "Please fill out the details field";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'Type Your Report Details ..',
                            labelText: 'Details ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                        child: Text(
                          'IOCs ',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Fill the following IOCs.\nIf you do not have an IOC please type  " - " ',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(108, 240, 240, 240)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: domainController,
                          validator: (domainController) {
                            if (domainController!.isEmpty) {
                              return "Please fill out the domain field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'ex: google.com ',
                            labelText: 'Domain',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (ipController) {
                            if (ipController!.isEmpty) {
                              return "Please fill out the IP field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'ex: 120.335.102.1 ',
                            labelText: 'IP ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (md5Controller) {
                            if (md5Controller!.isEmpty) {
                              return "Please fill out the MD5 field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'ex: 234fgbhnm45dfvgb3nmfvb5nm .. ',
                            labelText: 'MD5 ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (sha1Controller) {
                            if (sha1Controller!.isEmpty) {
                              return "Please fill out the SH1 field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText:
                                'ex: pojoiyiuguyft6yg3igigiouguyfyit4fugvg7jlhv4khg .. ',
                            labelText: 'SHA1 ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (sha256Controller) {
                            if (sha256Controller!.isEmpty) {
                              return "Please fill out the SHA256 field or type -";
                            } else {
                              return null;
                            }
                          },

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
                            hintText:
                                'ex: dgfdpiugy4fgpiguyvkjnkjnpghiyg4325hovigcvo2gv4igv ...',
                            labelText: 'SHA256 ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (emailController) {
                            if (emailController!.isEmpty) {
                              return "Please fill out the SHa256 field or type -";
                            } else {
                              return null;
                            }
                          },

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
                            hintText: 'ex: Email@hotmail.com .. ',
                            labelText: 'Email ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (urlController) {
                            if (urlController!.isEmpty) {
                              return "Please fill out the URL field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'ex: www.google.com .. ',
                            labelText: 'URL ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                          validator: (cveController) {
                            if (cveController!.isEmpty) {
                              return "Please fill out the CVE field or type -";
                            } else {
                              return null;
                            }
                          },
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
                            hintText: 'ex: CVE-2021-894421 .. ',
                            labelText: 'CVE ',
                            labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            hintStyle: TextStyle(
                                fontSize: 20.0,
                                color: Color.fromARGB(108, 240, 240, 240)),
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
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

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
                            print("test");
                          },
                          child: Text("SUBMIT"))
                    ],
                  ),
                ),
              ))),

      // ############ bottomNavigationBar ############ //

      // ############ bottomNavigationBar ############ //
    );
  }
}
