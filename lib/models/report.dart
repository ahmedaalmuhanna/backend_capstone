// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:capstoe_frontend/models/iocs.dart';

class Report {
  int id;
  int profile_id;
  IOCS iocs;
  String reference;
  String details;
  String title;
  String time;

  Report({
    required this.id,
    required this.profile_id,
    required this.iocs,
    required this.reference,
    required this.details,
    required this.title,
    required this.time,
  });
}
