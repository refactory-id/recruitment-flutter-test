import 'package:injector/injector.dart';
import 'package:refactory_flutter_test/app/ui/pages/home/controller.dart';
import 'package:refactory_flutter_test/app/ui/pages/users/controller.dart';
import 'package:refactory_flutter_test/app/ui/pages/users/presenter.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<HomeController>((Injector injector) {
      return HomeController();
    });

    injector.registerDependency<UsersController>((Injector injector) {
      return UsersController(injector.getDependency<UsersPresenter>());
    });
  }
}