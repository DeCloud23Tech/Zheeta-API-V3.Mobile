import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/dio_props.dart';
import 'package:zheeta/app/injection/di.config.dart';

final locator = GetIt.instance;

@InjectableInit()
injectDependency(String env) {
  locator.registerFactory<Dio>(() => Dio(options));
  locator.init(environment: env);
}
