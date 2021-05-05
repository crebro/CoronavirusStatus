import 'package:http/http.dart' as http;

class HttpService {
  String requestLocation;
  HttpService({required this.requestLocation});

  Future<http.Response> getRequest() async {
    http.Response response = await http.get(Uri.parse(this.requestLocation));
    print(response.body);
    return response;
  }
}
