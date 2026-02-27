import 'package:dartz/dartz.dart';
import 'package:tutorial/core/errors/failure.dart';

abstract class UseCaseWithParams<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseWithoutParams<T> {
  Future<Either<Failure, T>> call();
}
