import 'package:escribo_star_wars/core/http_client/http_client.dart';

import 'package:http/http.dart' as http;

class HttpClientImp implements IHttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url),
        headers: {"Content-type": "application/json", 'charset': 'utf-8'});
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
