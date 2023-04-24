import 'package:core/core.dart';
import 'package:core/src/modules/offline_sync/offline_first_module.dart';
import 'package:core/src/services/connection/connectivity/connection_service.dart';
import 'package:core/src/services/local_storage/hive_local_storage_service.dart';
import 'package:core/src/services/snack_bar/snack_bar_service.dart';
import 'package:dependencies/dependencies.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    ...OfflineFirstModule().binds,
    Bind.lazySingleton(
      (i) => HiveLocalStorageService(boxName: 'TodoApp'),
      export: true,
    ),
    Bind.lazySingleton((i) => ConnectionService(), export: true),
    Bind.lazySingleton((i) => ConnectionStore(i()), export: true)
  ];
}
