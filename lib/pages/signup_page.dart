import 'package:capstoe_frontend/models/user.dart';
import 'package:capstoe_frontend/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        // resizeToAvoidBottomInset: false,
        // body: Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Column(
        //     children: [
        //       const Text("Sign Up"),
        //       TextField(
        //         decoration: const InputDecoration(hintText: 'email'),
        //         controller: emailController,
        //       ),
        //       TextField(
        //         decoration: const InputDecoration(hintText: 'Username'),
        //         controller: usernameController,
        //       ),
        //       TextField(
        //         decoration: const InputDecoration(hintText: 'Password'),
        //         controller: passwordController,
        //         obscureText: true,
        //       ),
        //       ElevatedButton(
        //         onPressed: () {
        //           context.push("/");
        //           context.read<AuthProvider>().signup(User(
        //               username: usernameController.text,
        //               email: emailController.text,
        //               password: passwordController.text));
        //         },
        //         child: const Text("Sign Up"),
        //       )
        //     ],

        //   ),
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  height: 400,
                  margin: new EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            margin: EdgeInsets.all(4.0),
                            child: const Text(
                              "",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            )),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 26, 44),
                        ),
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.security,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 26, 44),
                        ),
                        controller: usernameController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 255, 255, 255)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(255, 0, 26, 44),
                        ),
                        controller: passwordController,
                        obscureText: true,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('object');
                          context.read<AuthProvider>().signup(User(
                              username: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text));
                          context.push("/");
                        },
                        child: const Text("Sign Up"),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
