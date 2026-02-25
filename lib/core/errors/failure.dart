import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  @override
  List<Object?> get props => [statusCode, message];
}
