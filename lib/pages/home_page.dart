import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/cyber-network-1440x2560-internet-6k-18684.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
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
    );
  }
}
