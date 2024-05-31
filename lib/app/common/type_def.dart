import 'package:dartz/dartz.dart';
import 'package:zheeta/app/api/errors/error.dart';

typedef ResultFuture<T> = Future<Either<ZheetaError, T>>;
typedef ResultVoid = Future<Either<ZheetaError, void>>;

typedef FutureBool = Future<bool>;

typedef DataMap = Map<String, String>;

typedef DataMapJson = Map<String, dynamic>;
