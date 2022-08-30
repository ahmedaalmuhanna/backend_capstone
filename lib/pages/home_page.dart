import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
