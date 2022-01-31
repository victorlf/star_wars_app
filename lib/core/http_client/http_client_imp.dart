import 'package:escribo_star_wars/core/http_client/http_client.dart';

import 'package:http/http.dart' as http;

class HttpClientImp implements IHttpClient {
  @override
  Future<HttpResponse> get(Uri uri) async {
    final response = await http.get(uri,
        headers: {"Content-type": "application/json", 'charset': 'utf-8'});
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
