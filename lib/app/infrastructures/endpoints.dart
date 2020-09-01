import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  String baseUrl;

  Endpoints(String baseUrl) {
    print(DotEnv().env['BASE_URL']);
    
    this.baseUrl = baseUrl;
  }

  String users() {
    return 'userjsondemo/db';
  }
}