import 'package:get_it/get_it.dart';
import 'package:tutorial/auth/data/datasources/user_remote_datasource.dart';
import 'package:tutorial/auth/data/repos/user_repos.dart';
import 'package:tutorial/auth/domain/repos/i_user_repos.dart';
import 'package:tutorial/auth/domain/usecases/create_user_uc.dart';
import 'package:tutorial/auth/domain/usecases/get_all_users_uc.dart';
import 'package:tutorial/auth/domain/usecases/update_user_uc.dart';
import 'package:tutorial/auth/presentation/bloc/user/user_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(
      () =>
          UserBloc(createUserUC: sl(), getAllUsersUC: sl(), updateUserUC: sl()),
    )
    ..registerLazySingleton(() => CreateUserUC(repository: sl()))
    ..registerLazySingleton(() => GetAllUsersUC(repository: sl()))
    ..registerLazySingleton(() => UpdateUserUC(repository: sl()))
    ..registerLazySingleton<IUserRepos>(() => UserRepos(remoteDatasource: sl()))
    ..registerLazySingleton<IUserRemoteDatasource>(
      () => UserRemoteDatasource(),
    );
}
