class ResponseException {
  final int? statusCode;
  final Object? data;

  ResponseException(this.statusCode, {this.data});
}
