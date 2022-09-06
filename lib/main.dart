import 'dart:async';

import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/pages/add_report_page.dart';
import 'package:capstoe_frontend/pages/edit_profile_page.dart';
import 'package:capstoe_frontend/pages/home_page.dart';
import 'package:capstoe_frontend/pages/report_details.dart';

import 'package:capstoe_frontend/pages/signin_page.dart';
import 'package:capstoe_frontend/pages/signup_page.dart';
import 'package:capstoe_frontend/providers/reports_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var reportProvider = ReportProvider();
  var authProvider = AuthProvider();

  unawaited(reportProvider.getReportFromService());
  var didLogin = await authProvider.canLoginFromStoredToken();

  print("didLogni $didLogin");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => authProvider),
        ChangeNotifierProvider<ReportProvider>(create: (_) => reportProvider)
      ],
      child: MyApp(initRoute: didLogin ? "/homepage" : "/"),
    ),
  );
}

class MyApp extends StatelessWidget {
  String? initRoute;

  final GoRouter router;

  MyApp({this.initRoute, Key? key})
      : router = GoRouter(initialLocation: initRoute, routes: [
          GoRoute(
              path: '/homepage',
              builder: (context, state) => HomePage()), // home adress
          GoRoute(
              path: '/signup',
              builder: (context, state) => SignupPage()), // home adress
          GoRoute(
            path: '/',
            builder: (context, state) => SigninPage(),
          ),
          GoRoute(
            path: '/adding-report',
            builder: (context, state) => AddReportPage(),
          ),
          GoRoute(
            path: '/report-details',
            builder: (context, state) => ReportDetailsPage(
              myReport: state.extra as Report,
            ),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => EditProfilePage(),
          ),

          // GoRoute(
          //     path: '/signed_in',
          //     builder: (context, state) =>
          //         SignedIn(userName: state.extra as String)), // signed_in address
          // the thirs address ..
        ]),
        super(key: key);

  @override
  Widget build(BuildContext context) {
// Router
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
