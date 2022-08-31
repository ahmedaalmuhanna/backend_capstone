import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/services/reports_service.dart';
import 'package:flutter/cupertino.dart';

class ReportProvider extends ChangeNotifier {
  List<Report> myReport = [];

  Future<void> getReportFromService() async {
    print("in provider");
    myReport = await ReportService().getReports();
    print("in provider2");
    notifyListeners();
  }
}
