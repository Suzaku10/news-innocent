import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:news_innocent/store/news/list/news_list_store.dart';
import 'package:news_innocent/utils/register.dart';

void main() {
  register.doRegister();

  test('fetch data and hope the data is not empty', () async {
    NewsListStore store = GetIt.I.get();
    try {
      await store.fetchNews();
      expect(store.news.isNotEmpty, true);
    } catch (e) {
      expect(store.news.isNotEmpty, false);
    }
  });

  test('change index', () async {
    NewsListStore store = GetIt.I.get();
    expect(store.initialIndex, 0);

    store.changeIndex(1);
    expect(store.initialIndex, 1);
  });
}
