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
          await Client.dio.get("/api/reportlist/"); // path is the view path
      myReport =
          (myResponse.data as List).map((e) => Report.fromMap(e)).toList();
      print(myReport[0].profile.username);
    } on DioError catch (error) {
      print("in error");
      print(error.message);
    }

    return myReport;
  }
}
