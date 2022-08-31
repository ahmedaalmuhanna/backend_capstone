import 'package:capstoe_frontend/services/reports_service.dart';
import 'package:flutter/cupertino.dart';

class ReportProvider extends ChangeNotifier {
  void getReportFromService() {
    ReportService().getReports();
  }
}
