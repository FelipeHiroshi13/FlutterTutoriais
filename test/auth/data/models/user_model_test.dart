import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial/auth/data/models/user_model.dart';
import 'package:tutorial/auth/domain/entities/user.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tUserModel = UserModel(id: '1', name: 'John Doe', email: '');

  test('should be a subclass of [User]', () {
    expect(tUserModel, isA<User>());
  });

  group('fromMap', () {
    test('should return a valid UserModel', () {
      final map = jsonDecode(fixture('user.json')) as Map<String, dynamic>;

      final result = UserModel.fromMap(map);

      expect(result.id, '12312');
      expect(result.name, 'Nome');
      expect(result.email, 'nome@email.com');
    });
  });

  group('toMap', () {
    test('should return a valid map from UserModel', () {
      const userModel = UserModel(id: 'id', name: 'name', email: 'email');

      final result = userModel.toMap();

      expect(result, {'id': 'id', 'name': 'name', 'email': 'email'});
    });
  });
}
