import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tutorial/auth/domain/entities/user.dart';
import 'package:tutorial/auth/domain/usecases/create_user_uc.dart';
import 'package:tutorial/auth/domain/usecases/get_all_users_uc.dart';
import 'package:tutorial/auth/domain/usecases/update_user_uc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.createUserUC,
    required this.getAllUsersUC,
    required this.updateUserUC,
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) {
      emit(UserLoading());
    });
    on<CreateUserEvent>(createUser);
    on<GetAllUsersEvent>(getAllUser);
    on<UpdateUserEvent>(updateUser);
  }

  final CreateUserUC createUserUC;
  final GetAllUsersUC getAllUsersUC;
  final UpdateUserUC updateUserUC;

  Future<void> createUser(
    CreateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final result = await createUserUC(
      CreateUserParams(name: event.name, email: event.email),
    );

    result.fold(
      (l) => emit(UserError(message: l.toString())),
      (_) => CreatedUser(),
    );
  }

  Future<void> getAllUser(
    GetAllUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    final result = await getAllUsersUC();

    result.fold(
      (l) => emit(UserError(message: l.toString())),
      (users) => emit(UserList(users: users)),
    );
  }

  Future<void> updateUser(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final result = await updateUserUC(event.user);

    result.fold(
      (l) => emit(UserError(message: l.toString())),
      (_) => emit(UpdatedUser()),
    );
  }
}
