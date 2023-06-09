import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'i_local_storage_service.dart';

class HiveLocalStorageService implements ILocalStorageService {
  late Box box;
  final String boxName;

  HiveLocalStorageService({required this.boxName}) {
    _init();
  }

  Future<void> _init() async {
    if (!kIsWeb) {
      final directory = await getApplicationDocumentsDirectory();
      Hive.init(directory.path);
    }

    box = await Hive.openBox(boxName);
  }

  @override
  Future<bool> add(String key, Map<String, dynamic> value) async {
    var listValue = await box.get(key) as List? ?? [];

    final iterable = listValue.where((element) => element['id'] == value['id']);

    if (iterable.isNotEmpty) return false;

    listValue.add(value);

    await box.put(key, listValue);

    return true;
  }

  @override
  Future<List<Map<String, dynamic>>> get(String key) async {
    await _init();
    var listValue = await box.get(key) as List? ?? [];
    var result = listValue.map((e) => Map<String, dynamic>.from(e)).toList();
    return result;
  }

  @override
  Future<void> clear(String key) async {
    await box.put(key, []);
  }
}
