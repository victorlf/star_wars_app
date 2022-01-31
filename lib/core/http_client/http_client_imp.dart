import 'package:escribo_star_wars/core/http_client/http_client.dart';

import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return HttpResponse(data: response.body, statusCode: response.statusCode);
  }
}
