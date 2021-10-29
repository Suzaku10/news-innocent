import 'package:flutter/material.dart';
import 'package:news_innocent/utils/register.dart';
import 'package:news_innocent/view/news/list/news_list_view.dart';

void main() {
  register.doRegister();
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
      home: const NewsListView(),
    );
  }
}
