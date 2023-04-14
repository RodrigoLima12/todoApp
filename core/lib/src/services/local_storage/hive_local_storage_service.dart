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
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    box = await Hive.openBox(boxName);
  }

  @override
  Future<bool> add(String key, Map<String, dynamic> value) {
    // TODO: implement add
    throw UnimplementedError();
  }
}
