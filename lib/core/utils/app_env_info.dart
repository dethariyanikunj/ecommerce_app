import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvInfo {
  static String get apiBaseUrl => dotenv.get('API_BASE_URL');
}
