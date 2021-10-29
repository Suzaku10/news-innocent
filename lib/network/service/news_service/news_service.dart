import 'package:news_innocent/configurable/dio/base_dio_service.dart';
import 'package:news_innocent/configurable/service_url.dart';
import 'package:news_innocent/data/remote/news_response/news_response.dart';

class NewsService extends BaseServiceDio {
  Future<List<NewsResponse>?> fetchNews() async {
    try {
      final response = await service.get(ServiceUrl.news);
      if (response is List) {
        return response.map((e) => NewsResponse.fromJson(e)).toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
