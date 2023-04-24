import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

class OfflineFirstModule extends Module {
  final List<Bind<Object>> binds = [
    Bind.lazySingleton(
      (i) => SyncStore(i()),
      export: true,
    )
  ];
}
