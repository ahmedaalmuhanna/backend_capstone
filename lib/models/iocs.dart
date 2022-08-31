// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IOCS {
  String cve;
  String url;
  String domain;
  String ip;
  String md5;
  String sha1;
  String sha256;
  String email;

  IOCS(
      {required this.cve,
      required this.domain,
      required this.email,
      required this.ip,
      required this.md5,
      required this.sha1,
      required this.sha256,
      required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cve': cve,
      'url': url,
      'domain': domain,
      'ip': ip,
      'md5': md5,
      'sha1': sha1,
      'sha256': sha256,
      'email': email,
    };
  }

  factory IOCS.fromMap(Map<String, dynamic> map) {
    return IOCS(
      cve: map['cve'] as String,
      url: map['url'] as String,
      domain: map['domain'] as String,
      ip: map['ip'] as String,
      md5: map['md5'] as String,
      sha1: map['sha1'] as String,
      sha256: map['sha256'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IOCS.fromJson(String source) =>
      IOCS.fromMap(json.decode(source) as Map<String, dynamic>);
}
