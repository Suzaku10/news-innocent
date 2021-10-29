import 'package:get_it/get_it.dart';
import 'package:news_innocent/store/news/list/news_list_store.dart';

final register = StoreRegister();

class StoreRegister {
  doRegister() {
    GetIt.I.registerSingleton<NewsListStore>(NewsListStore());
  }
}
