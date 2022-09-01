import 'dart:async';

import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/pages/add_report_page.dart';
import 'package:capstoe_frontend/pages/home_page.dart';

import 'package:capstoe_frontend/pages/signin_page.dart';
import 'package:capstoe_frontend/pages/signup_page.dart';
import 'package:capstoe_frontend/providers/reports_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

void main() {
  var reportProvider = ReportProvider();

  unawaited(reportProvider.getReportFromService());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<ReportProvider>(create: (_) => reportProvider)
      ],
      child: MyApp(),
    ),
  );
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

  final _router = GoRouter(initialLocation: "/", routes: [
    GoRoute(
        path: '/', builder: (context, state) => HomeScreen()), // home adress
    GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage()), // home adress
    GoRoute(
      path: '/signin',
      builder: (context, state) => SigninPage(),
    ),
    GoRoute(
      path: '/adding-report',
      builder: (context, state) => AddReportPage(),
    ),
    // GoRoute(
    //     path: '/signed_in',
    //     builder: (context, state) =>
    //         SignedIn(userName: state.extra as String)), // signed_in address
    // the thirs address ..
  ]);
}
