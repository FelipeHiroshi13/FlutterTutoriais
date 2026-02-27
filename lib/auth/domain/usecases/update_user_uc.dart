import 'package:dartz/dartz.dart';
import 'package:tutorial/auth/domain/entities/user.dart';
import 'package:tutorial/auth/domain/repos/i_user_repos.dart';
import 'package:tutorial/core/errors/failure.dart';
import 'package:tutorial/core/usecase/usecase.dart';

class UpdateUserUC extends UseCaseWithParams<bool, User> {
  UpdateUserUC({required this.repository});

  final IUserRepos repository;

  @override
  Future<Either<Failure, bool>> call(User user) async =>
      repository.updateUser(user);
}
