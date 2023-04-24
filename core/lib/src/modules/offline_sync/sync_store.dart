import 'package:core/core.dart';

class SyncStore {
  final ILocalStorageService localStorageService;

  SyncStore(this.localStorageService);

  Future<void> addSync(SyncModel sync) async {
    await localStorageService.add('offlineFirst', sync.toMap());
  }

  Future<void> sync() async {
    final syncsModel = await localStorageService.get('offlineFirst');
    final syncs = syncsModel.map((e) => SyncModel.fromMap(e));

    for (final sync in syncs) {
      if (sync.operation == SyncOperationEnum.add) {
        localStorageService.add(sync.key, sync.data);
      }
    }
    localStorageService.clear('offlineFirst');
  }
}
