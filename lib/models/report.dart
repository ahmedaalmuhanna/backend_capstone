// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:capstoe_frontend/models/iocs.dart';
import 'package:capstoe_frontend/models/profile.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Report {
  int? id;
  Profile profile;
  IOCS iocs;
  String reference;
  String details;
  String title;
  String time;

  Report({
    this.id,
    required this.profile,
    required this.iocs,
    required this.reference,
    required this.details,
    required this.title,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profile': profile.toMap(),
      'iocs': iocs.toMap(),
      'reference': reference,
      'details': details,
      'title': title,
      'time': time,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      id: map['id'] != null ? map['id'] as int : null,
      profile: Profile.fromMap(map['profile'] as Map<String, dynamic>),
      iocs: IOCS.fromMap(map['iocs'] as Map<String, dynamic>),
      reference: map['reference'] as String,
      details: map['details'] as String,
      title: map['title'] as String,
      time: map['time'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);
}
