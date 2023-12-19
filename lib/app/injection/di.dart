import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/injection/di.config.dart';

final locator = GetIt.instance;

@InjectableInit()
injectDependency(String env) => locator.init(environment: env);
