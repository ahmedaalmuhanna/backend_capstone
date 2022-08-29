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
}
