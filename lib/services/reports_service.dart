// ignore_for_file: unused_field, unused_local_variable

import 'package:capstoe_frontend/services/client.dart';
import 'package:dio/dio.dart';

import '../models/report.dart';

class ReportService {
  final _dio = Dio();
  late List<Report> myReport;

  // get all reports:
  Future<List<Report>> getReports() async {
    Response myResponse = await Client.dio.get("path"); // path is the view path
    // myReport = (myResponse.data as List).map((e) =>)

    return myReport;
  }
}
