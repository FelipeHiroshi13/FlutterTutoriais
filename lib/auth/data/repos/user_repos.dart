import 'package:dartz/dartz.dart';
import 'package:tutorial/auth/data/datasources/user_remote_datasource.dart';
import 'package:tutorial/auth/domain/entities/user.dart';
import 'package:tutorial/auth/domain/repos/i_user_repos.dart';
import 'package:tutorial/core/errors/failure.dart';

class UserRepos implements IUserRepos {
  UserRepos({required this.remoteDatasource});

  final IUserRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, bool>> createUser(String name, String email) async {
    try {
      final result = await remoteDatasource.createUser(name, email);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(statusCode: 500, message: 'Erro inesperado'));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllUsers() async {
    try {
      final result = await remoteDatasource.getAllUsers();

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(statusCode: 500, message: 'Erro inesperado'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateUser(User user) async {
    try {
      final result = await remoteDatasource.updateUser(user);

      return Right(result);
    } catch (e) {
      return Left(ServerFailure(statusCode: 500, message: 'Erro inesperado'));
    }
  }
}
