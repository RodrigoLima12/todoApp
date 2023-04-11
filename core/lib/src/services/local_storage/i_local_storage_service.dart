import 'package:core/src/services/local_storage/helpers/responses.dart';

abstract class ILocalStorageService {
  Future<bool> add(String key, Map<String, dynamic> value);
}
