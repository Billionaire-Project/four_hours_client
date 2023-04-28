import 'package:four_hours_client/network/dio_client.dart';

abstract class BaseRepository {
  final DioClient dioClient = DioClient();
}
