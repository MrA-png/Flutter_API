import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_api_berita/data/model/article.dart';

class ApiService{
  static final String _baseUrl = 'https://newsapi.org/v2/';
  static final String _apiKey = '305fdce8cec242ed8f9f50d86df7166d';
  static final String _category = 'business';
  static final String _country = 'id';

  Future<ArticlesResult> topHeadLines() async {
    final response = await http.get(Uri.parse(_baseUrl +
    "top-headlines?county=$_country&category=$_category&apikey=$_apiKey"));
    if(response.statusCode == 200){
      return ArticlesResult.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load top headlines');
    }
  }
}