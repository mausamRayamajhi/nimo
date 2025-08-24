import 'package:ft_foundation/di/service_locator.dart';

class AppModule {
  ServiceLocator serviceLocator;

  AppModule(this.serviceLocator);

  Future<void> initialise() async {
    //TODO [Crypto App] : Initialize app level dependency
  }
}
