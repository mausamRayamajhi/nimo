import 'package:ft_foundation/di/app_module.dart';
import 'package:ft_foundation/di/service_locator.dart';
import 'package:ft_foundation/di/service_locator_impl.dart';
import 'package:ft_foundation/network/crypto_http_client.dart';

class AppLaunchModule {
  Future<void> initialise() async {
    // Initialise service provider
    ServiceLocatorImpl().initialise();
    final serviceLocator = ServiceLocator.serviceLocator;

    // Register app level dependencies
    await AppModule(serviceLocator).initialise();

    if (!serviceLocator.isRegistered<CryptoHttpClient>()) {
      serviceLocator.registerSingleton(CryptoHttpClient.internal());
    }
  }
}
