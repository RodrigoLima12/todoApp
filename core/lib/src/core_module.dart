import 'package:core/src/services/local_storage/hive_local_storage_service.dart';
import 'package:core/src/services/snack_bar/snack_bar_service.dart';
import 'package:dependencies/dependencies.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton(
          (i) => HiveLocalStorageService(boxName: 'TodoApp'),
          export: true,
        ),
      ];
}
