abstract class IHttpClient {
  Future<HttpResponse> get(Uri uri);
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({required this.data, required this.statusCode});
}
