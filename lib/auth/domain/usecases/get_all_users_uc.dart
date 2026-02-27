import 'package:dartz/dartz.dart';
import 'package:tutorial/auth/domain/entities/user.dart';
import 'package:tutorial/auth/domain/repos/i_user_repos.dart';
import 'package:tutorial/core/errors/failure.dart';
import 'package:tutorial/core/usecase/usecase.dart';

class GetAllUsersUC extends UseCaseWithoutParams<List<User>> {
  GetAllUsersUC({required this.repository});

  final IUserRepos repository;

  @override
  Future<Either<Failure, List<User>>> call() async => repository.getAllUsers();
}
