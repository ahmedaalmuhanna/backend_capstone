import 'package:capstoe_frontend/models/report.dart';
import 'package:capstoe_frontend/services/reports_service.dart';
import 'package:flutter/cupertino.dart';

class ReportProvider extends ChangeNotifier {
  List<Report> myReport = [];
  var isLoading = false;

  Future<void> getReportFromService() async {
    print("in provider");
    isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 20));

      myReport = await ReportService().getReports();
      print("in provider2");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
