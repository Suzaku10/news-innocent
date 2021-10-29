import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:news_innocent/data/constant/color.dart';
import 'package:news_innocent/data/constant/state.dart';
import 'package:news_innocent/data/remote/news_response/news_response.dart';
import 'package:news_innocent/store/news/list/news_list_store.dart';
import 'package:news_innocent/utils/function_helper.dart';
import 'package:news_innocent/view/component/appbar.dart';
import 'package:news_innocent/view/component/error.dart';
import 'package:news_innocent/view/component/loading.dart';
import 'package:news_innocent/view/news/detail/news_detail_view.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsListView extends StatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  late NewsListStore _listStore;

  @override
  void initState() {
    _listStore = GetIt.I.get();
    _listStore.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar(),
        body: Observer(
          builder: (_) {
            switch (_listStore.newsStatus) {
              case NetworkState.loading:
                return loading();
              case NetworkState.loaded:
                return _newsList();
              case NetworkState.error:
                return error();
            }
          },
        ));
  }

  Widget _newsList() {
    return Observer(
      builder: (BuildContext context) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => _newsItem(_listStore.news[index]),
          separatorBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Container(
                  color: grey,
                  height: 1,
                  width: double.infinity,
                ),
              ),
          itemCount: _listStore.news.length),
    );
  }

  Widget _newsItem(NewsResponse item) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => NewsDetailView(
            argument: item,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              placeholder: getSourceByName('logo_celebrities_id'),
              image: item.contentThumbnail ?? ''),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Genre',
              style: TextStyle(
                  color: pink, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 20),
            child: Text(
              item.title ?? '',
              maxLines: 3,
              style: const TextStyle(
                  fontSize: 18, color: black, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            timeago.format(item.createdAt!),
            style: const TextStyle(color: grey, fontSize: 12),
          )
        ],
      ),
    );
  }
}
