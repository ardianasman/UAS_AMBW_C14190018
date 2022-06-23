import 'dart:convert';

import 'package:uas_ambw_c14190018/dataClass.dart';

class ResponseClass {
  ResponseClass({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  dynamic message;
  DataPost data;

  factory ResponseClass.fromJson(Map<String, dynamic> json) => ResponseClass(
        success: json["success"],
        message: json["message"],
        data: DataPost.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}
