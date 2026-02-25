import 'package:dartz/dartz.dart';
import 'package:tutorial/auth/domain/entities/user.dart';
import 'package:tutorial/core/errors/failure.dart';

abstract class IUserRepos {
  Future<Either<Failure, List<User>>> getAllUsers();

  Future<Either<Failure, bool>> createUser(String name, String email);

  Future<Either<Failure, bool>> updateUser(User user);
}
