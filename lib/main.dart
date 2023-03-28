import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_berita/data/model/article.dart';
import 'package:flutter_api_berita/ui/article_detail_page.dart';
import 'package:flutter_api_berita/ui/article_list_page.dart';
import 'package:flutter_api_berita/ui/article_web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => ArticleListPage(),
        '/article_web': (context) =>
            ArticleWebView(
              ModalRoute.of(context)?.settings.arguments as String, url: '',
            ),
        '/article_detail' : (context) =>
            ArticleDetailPage(
              ModalRoute.of(context)?.settings.arguments as Article
            ),
      },
    );
  }
}