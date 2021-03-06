import 'package:injector/injector.dart';
import 'package:refactory_flutter_test/app/infrastructures/endpoints.dart';
import 'package:refactory_flutter_test/app/infrastructures/persistences/api_service.dart';
import 'package:refactory_flutter_test/app/repositories/api/user_api_repository.dart';
import 'package:refactory_flutter_test/data/persistences/mappers/user_mapper.dart';

class RepositoryModule {
  static init(Injector injector) {
    injector.registerDependency<UserApiRepository>( (Injector injector) {
      return UserApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<UserMapper>()
      );
    });
  }
}