class Endpoints {
  Endpoints._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static const Duration connectTimeout = Duration(milliseconds: 5000);

  static const Duration receiveTimeout = Duration(milliseconds: 3000);
}
