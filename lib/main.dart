import 'package:capstoe_frontend/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Router
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
        path: '/', builder: (context, state) => HomeScreen()), // home adress
    // GoRoute(
    //     path: '/signed_in',
    //     builder: (context, state) =>
    //         SignedIn(userName: state.extra as String)), // signed_in address
    // the thirs address ..
  ]);
}
