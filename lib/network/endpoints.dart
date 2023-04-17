class Endpoints {
  Endpoints._();

  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  // TODO: 개발 서버 주소로 변경
  static const String baseUrl = 'http://0.0.0.0:8000';

  static const Duration connectTimeout = Duration(milliseconds: 5000);

  static const Duration receiveTimeout = Duration(milliseconds: 3000);
}
