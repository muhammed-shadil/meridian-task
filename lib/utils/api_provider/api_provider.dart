import 'package:http/http.dart' as http;

class Apiprovider {
  Future<http.Response> homescreenlist() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    return response;
  }
}
