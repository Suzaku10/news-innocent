import 'package:flutter/material.dart';
import 'package:news_innocent/view/component/appbar.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'You have pushed the button this many times:',
            )
          ],
        ),
      ),
    );
  }
}
