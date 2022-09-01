// ignore_for_file: unused_field, unused_local_variable

import 'package:capstoe_frontend/services/client.dart';
import 'package:dio/dio.dart';

import '../models/report.dart';

class ReportService {
  final _dio = Dio();
  late List<Report> myReport;

  // get all reports:
  Future<List<Report>> getReports() async {
    print("in service");

    try {
      print("in try");
      Response myResponse =
          await Client.dio.get("Reportlist/"); // path is the view path
      myReport =
          (myResponse.data as List).map((e) => Report.fromJson(e)).toList();
    } on DioError catch (error) {
      print("in error");
      print(error.message);
    }

    return myReport;
  }
}
