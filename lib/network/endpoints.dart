class Endpoints {
  Endpoints._();

  static const String baseUrl = 'http://lukaid.iptime.org:8000/api/v1';

  static const Duration connectTimeout = Duration(milliseconds: 5000);

  static const Duration receiveTimeout = Duration(milliseconds: 3000);
}
