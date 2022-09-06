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

  Future<Report> createReport({required Report myReport}) async {
    late Report createdReport;
    try {
      FormData data = FormData.fromMap({
        "title": myReport.title,
        "refrtrmce": myReport.reference,
        "details": myReport.details,
        "time": myReport.time,
        "cve": myReport.iocs.cve,
        "url": myReport.iocs.url,
        "domain": myReport.iocs.domain,
        "ip    ": myReport.iocs.ip,
        "md5   ": myReport.iocs.md5,
        "sha1  ": myReport.iocs.sha1,
        "sha256": myReport.iocs.sha256,
        "email ": myReport.iocs.email,
      });
      Response myResponse =
          await Client.dio.post('/api/reportcreate/', data: data);
      print(myResponse.data);
      createdReport = Report.fromMap(myResponse.data);
    } on DioError catch (error) {
      print(error);
    }
    return createdReport;
  }
}
