import 'package:http/http.dart' as http;
import 'package:uas_ambw_c14190018/dataClass.dart';
import 'dart:convert';

import 'package:uas_ambw_c14190018/postsClass.dart';
import 'package:uas_ambw_c14190018/responseClass.dart';

class Service {
  Future<ResponseClass> getAllData() async {
    final response = await http.get(
        Uri.parse("https://api-berita-indonesia.vercel.app/cnbc/terbaru/"));
    if (response.statusCode == 200) {
      ResponseClass jsonResponse =
          ResponseClass.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
