import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/services/client.dart';
import 'package:capstoe_frontend/services/reports_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ReportProvider extends ChangeNotifier {
  List<Report> reports = [];
  late Report newReport;
  var isLoading = false;

  Future<void> getReportFromService() async {
    print("in provider");
    isLoading = true;

    try {
      reports = await ReportService().getReports();
      print("in provider2");
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  // Future<Report> createReport({required Report myNewReport}) async {
  //   newReport = await ReportService().createReport(myReport: myNewReport);
  //   return newReport;
  // }

  Future<bool> addReport({
    required String reference,
    required String details,
    required String title,
    //IOCs
    required String cve,
    required String url,
    required String domain,
    required String ip,
    required String md5,
    required String sha1,
    required String sha256,
    required String email,
  }) async {
    print("creating report \n");
    try {
      print("creating report - try \n");
      var data = ({
        "reference": reference,
        "details": details,
        "title": title,
        "iocs": {
          "cve": cve,
          "url": url,
          "domain": domain,
          "ip": ip,
          "md5": md5,
          "sha1": sha1,
          "sha256": sha256,
          "email": email,
        }
      });
      // var data = ({
      //   "reference": "https://www.google.com/",
      //   "details": "details",
      //   "title": "title",
      //   "iocs": {
      //     "cve": "cve",
      //     "url": "url",
      //     "domain": "domain",
      //     "ip": "ip",
      //     "md5": "md5",
      //     "sha1": "sha1",
      //     "sha256": "sha256",
      //     "email": "email",
      //   }
      // });
      // newReport = Report(profile: profile, iocs: iocs, reference: reference, details: details, title: title, time: time)
      print('my response : Response res\n');
      Response res = await Client.dio.post("/api/reportcreate/", data: data);
      print('my response : $res');
      print('my response : ${res.data}');
      var addedReport = Report.fromMap(res.data);

      reports.insert(0, addedReport);
      return true;
    } on DioError catch (error) {
      print(error);
      print(error.response?.data);
    }
    notifyListeners();
    return false;
  }
}
