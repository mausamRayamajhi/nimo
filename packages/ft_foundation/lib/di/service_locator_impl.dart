import 'package:ft_foundation/di/service_locator.dart';
import 'package:get_it/get_it.dart';

class ServiceLocatorImpl implements ServiceLocator {
  static final _serviceLocator = GetIt.instance;

  @override
  void initialise() {
    if (!isRegistered<ServiceLocator>()) {
      _serviceLocator
          .registerSingleton<ServiceLocator>(ServiceLocator.serviceLocator);
    }
  }

  @override
  bool isRegistered<T extends Object>(
      {Object? instance, String? instanceName}) {
    return _serviceLocator.isRegistered<T>(instance: instance);
  }

  @override
  void registerLazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerLazySingleton<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  @override
  void registerLazySingletonAsync<T extends Object>(
    FactoryFuncAsync<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerLazySingletonAsync<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  @override
  void registerSingleton<T extends Object>(
    T instance, {
    String? instanceName,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerSingleton<T>(instance,
        instanceName: instanceName,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  @override
  void registerSingletonWithDependencies<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposingFunc<T>? dispose,
  }) {
    _serviceLocator.registerSingletonWithDependencies<T>(factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  @override
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _serviceLocator.get<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  @override
  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _serviceLocator.getAsync<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  @override
  Future<void> isReady<T extends Object>({
    Object? instance,
    String? instanceName,
    Duration? timeout,
    Object? callee,
  }) {
    return _serviceLocator.isReady<T>(
        instance: instance,
        instanceName: instanceName,
        timeout: timeout,
        callee: callee);
  }

  @override
  bool isReadySync<T extends Object>({
    Object? instance,
    String? instanceName,
  }) {
    return _serviceLocator.isReadySync<T>(
        instance: instance, instanceName: instanceName);
  }

  @override
  Future<void> reset() async {
    await _serviceLocator.reset();
  }
}
