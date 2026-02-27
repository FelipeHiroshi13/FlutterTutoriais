import 'package:tutorial/auth/data/models/user_model.dart';
import 'package:tutorial/auth/domain/entities/user.dart';

abstract class IUserRemoteDatasource {
  Future<List<UserModel>> getAllUsers();

  Future<bool> createUser(String name, String email);

  Future<bool> updateUser(User user);
}

class UserRemoteDatasource implements IUserRemoteDatasource {
  @override
  Future<bool> createUser(String name, String email) async {
    return true;
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    await Future.delayed(const Duration(seconds: 2));

    throw Exception('Erro ao buscar usuários');
    // return [
    //   UserModel(id: 'id', name: 'name', email: 'email'),
    //   UserModel(id: 'id', name: 'Joao', email: 'joao@gmail.com'),
    // ];
  }

  @override
  Future<bool> updateUser(User user) async {
    return true;
  }
}
