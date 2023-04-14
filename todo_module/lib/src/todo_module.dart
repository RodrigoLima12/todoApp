import 'package:dependencies/dependencies.dart';
import 'package:todo_module/src/presenter/controllers/form_controller.dart';
import 'package:todo_module/src/presenter/pages/home_page.dart';

class TodoModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => FormController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) =>
              HomePage(formController: Modular.get<FormController>()),
        ),
      ];
}
