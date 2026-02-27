part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetAllUsersEvent extends UserEvent {}

class CreateUserEvent extends UserEvent {
  const CreateUserEvent({required this.name, required this.email});

  final String name;
  final String email;
}

class UpdateUserEvent extends UserEvent {
  const UpdateUserEvent({required this.user});

  final User user;
}
