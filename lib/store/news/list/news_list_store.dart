import 'package:mobx/mobx.dart';
import 'package:news_innocent/data/constant/state.dart';
import 'package:news_innocent/data/remote/news_response/news_response.dart';
import 'package:news_innocent/network/service/news_service/news_service.dart';

part 'news_list_store.g.dart';

class NewsListStore = _NewsListStore with _$NewsListStore;

abstract class _NewsListStore with Store {
  final NewsService _service = NewsService();
  @observable
  ObservableList<NewsResponse> news = ObservableList.of([]);

  @observable
  ObservableFuture? _newsFetch;

  @observable
  int initialIndex = 0;

  @computed
  NetworkState get newsStatus {
    if (_newsFetch?.status == FutureStatus.rejected) {
      return NetworkState.error;
    }

    return _newsFetch?.status == FutureStatus.pending
        ? NetworkState.loading
        : NetworkState.loaded;
  }

  @computed
  List<NewsResponse> get slideShow {
    try {
      return news.take(3).toList();
    } catch (e) {
      return [];
    }
  }

  @action
  Future<void> fetchNews() async {
    try {
      _newsFetch = ObservableFuture(_service.fetchNews());
      news = ObservableList.of(await _newsFetch);
    } catch (e) {
      rethrow;
    }
  }

  @action
  void changeIndex(int newIndex) => initialIndex = newIndex;
}
