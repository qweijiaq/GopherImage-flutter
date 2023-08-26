import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get apiBaseUrl =>
      dotenv.get('API_BASE_URL', fallback: 'http://127.0.0.1:3000');

  static String get apiHost => dotenv.get('API_HOST');

  static int get postsPerPage => int.parse(dotenv.get('POSTS_PER_PAGE'));
  static int get commentsPerPage => int.parse(dotenv.get('COMMENTS_PER_PAGE'));
  static int get licensesPerPage => int.parse(dotenv.get('LICENSES_PER_PAGE'));
  static int get ordersPerPage => int.parse(dotenv.get('ORDERS_PER_PAGE'));
}
