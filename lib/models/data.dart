import 'dart:convert';

class DataReq {
  final String token;
  final String name;

  DataReq({
    required this.token,
    required this.name,
  });

  factory DataReq.fromJson(Map<String, dynamic> json) {
    return DataReq(
      token: json['token'],
      name: json['name'],
    );
  }
}
