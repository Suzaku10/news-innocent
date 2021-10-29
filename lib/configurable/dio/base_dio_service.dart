import 'network_service_dio.dart';

class BaseServiceDio {
  late NetworkServiceDio service;

  BaseServiceDio() {
    service = NetworkServiceDio(
        "https://60a4954bfbd48100179dc49d.mockapi.io/api/innocent/");
  }
}
