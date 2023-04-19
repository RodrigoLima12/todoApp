import 'package:core/core.dart';
import 'package:core/src/modules/offline_sync/sync_enum.dart';
import 'package:core/src/modules/offline_sync/sync_model.dart';

class SyncStore {
  final ILocalStorageService localStorageService;

  SyncStore(this.localStorageService);

  void addSync(SyncModel sync) async {
    await localStorageService.add('offlineFirst', sync.toMap());
  }

  void sync() async {
    final syncsModel = await localStorageService.get('offlineFirst');
    final syncs = syncsModel.map((e) => SyncModel.fromMap(e));

    for (final sync in syncs) {
      if (sync.operation == SyncOperationEnum.add) {
        localStorageService.add('onlineTodos', sync.data);
      }
    }
  }
}
