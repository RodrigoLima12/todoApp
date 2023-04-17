import 'package:app/pages/splash_page.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:todo_module/todo_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
        ModuleRoute('/todo', module: TodoModule())
      ];
}
