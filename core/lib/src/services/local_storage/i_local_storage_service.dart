abstract class ILocalStorageService {
  Future<bool> add(String key, Map<String, dynamic> value);
  Future<List<Map<String,dynamic>>> get(String key);
}
