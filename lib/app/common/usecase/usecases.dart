import 'package:zheeta/app/common/type_def.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseValidatWithParamsBool<Params> {
  const UsecaseValidatWithParamsBool();
  bool call(Params params);
}

abstract class UsecaseValidatWithOutParamsBool {
  const UsecaseValidatWithOutParamsBool();
  FutureBool call();
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  ResultFuture<Type> call();
}
