part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserError extends UserState {
  const UserError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class UserList extends UserState {
  const UserList({required this.users});

  final List<User> users;
}

final class CreatedUser extends UserState {}

final class UpdatedUser extends UserState {}
