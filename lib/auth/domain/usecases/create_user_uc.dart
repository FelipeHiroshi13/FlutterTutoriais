import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorial/auth/domain/repos/i_user_repos.dart';
import 'package:tutorial/core/errors/failure.dart';
import 'package:tutorial/core/usecase/usecase.dart';

class CreateUserUC extends UseCaseWithParams<bool, CreateUserParams> {
  CreateUserUC({required this.repository});

  final IUserRepos repository;

  @override
  Future<Either<Failure, bool>> call(CreateUserParams params) async =>
      repository.createUser(params.name, params.email);
}

class CreateUserParams extends Equatable {
  const CreateUserParams({required this.name, required this.email});

  final String name;
  final String email;

  @override
  List<Object?> get props => [name, email];
}
