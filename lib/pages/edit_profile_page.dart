// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, unnecessary_new

import 'package:capstoe_frontend/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../providers/auth_provider.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  var _image;

  final _picker = ImagePicker();

  final _userName = TextEditingController();
  final _email = TextEditingController();

  final _bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var profile = context.read<AuthProvider>().user!;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 26, 44, 20),
          title: Center(child: Text('Edit Profile')),
        ),
        body: Container(
          width: 400,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(image!.path);
                  });
                },
                child: Container(
                  width: 150,
                  height: 150,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFDDDDDD),
                  ),
                  child: _image != null
                      ? CircleAvatar(
                          backgroundImage: new FileImage(_image),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFFDDDDDD)),
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                //************************************//
                child: Container(
                  child: SizedBox(
                    width: 350,
                    height: 125,
                    child: Text(
                      context.read<AuthProvider>().user!.bio,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  height: 125,
                  child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    expands: true,
                    maxLines: null,
                    controller: _bio,
                    decoration: InputDecoration(
                      hintText: "Write Your Bio In 30 Characters ...",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0xFF5F7161),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: () async {
                    var isUpdated = await context
                        .read<AuthProvider>()
                        .updateProfile(
                            username: _userName.text,
                            bio: _bio.text,
                            image: _image);
                    if (isUpdated) {
                      print("isupdated : ${isUpdated}");
                      context.push('/homepage');
                    }
                  },
                  child: Text('Update'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 26, 44))),
                ),
              )
            ],
          ),
        ));
  }
}
