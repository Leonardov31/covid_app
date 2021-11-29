import 'dart:convert';
import 'package:covid_app/env.dart';
import '../utils/api_urls.dart';
import '../models/covid_data_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future<List<CovidDataModel>> getData(String keyword) async {
    final response = await http.get(Uri.parse(baseUrl + keyword), headers: {
      'Authorization': apiKey,
    });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];

      return list.map((result) => CovidDataModel.fromMap(result)).toList();
    } else {
      throw Exception(response.body.toString());
    }
  }
}
