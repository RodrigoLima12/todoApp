import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/presenter/pages/home_page.dart';

class TodoModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ];
}
