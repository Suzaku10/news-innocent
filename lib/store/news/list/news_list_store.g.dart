// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsListStore on _NewsListStore, Store {
  Computed<NetworkState>? _$newsStatusComputed;

  @override
  NetworkState get newsStatus =>
      (_$newsStatusComputed ??= Computed<NetworkState>(() => super.newsStatus,
              name: '_NewsListStore.newsStatus'))
          .value;

  final _$newsAtom = Atom(name: '_NewsListStore.news');

  @override
  ObservableList<NewsResponse> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(ObservableList<NewsResponse> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$_newsFetchAtom = Atom(name: '_NewsListStore._newsFetch');

  @override
  ObservableFuture<dynamic>? get _newsFetch {
    _$_newsFetchAtom.reportRead();
    return super._newsFetch;
  }

  @override
  set _newsFetch(ObservableFuture<dynamic>? value) {
    _$_newsFetchAtom.reportWrite(value, super._newsFetch, () {
      super._newsFetch = value;
    });
  }

  final _$fetchNewsAsyncAction = AsyncAction('_NewsListStore.fetchNews');

  @override
  Future<void> fetchNews() {
    return _$fetchNewsAsyncAction.run(() => super.fetchNews());
  }

  @override
  String toString() {
    return '''
news: ${news},
newsStatus: ${newsStatus}
    ''';
  }
}
