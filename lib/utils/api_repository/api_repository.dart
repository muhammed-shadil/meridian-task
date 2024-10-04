import 'package:http/http.dart' as http;
import 'package:meridian_mechine_test/utils/api_provider/api_provider.dart';

class Apirepository {
  final Apiprovider apiprovider = Apiprovider();
  Future<http.Response> homescreenRepository() async {
    return apiprovider.homescreenlist();
  }
}
