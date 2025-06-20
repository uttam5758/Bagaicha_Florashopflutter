import 'package:bagaicha_florashop/core/network/hive_service.dart';
import 'package:bagaicha_florashop/feature/auth/data/data_source/remote_datasource/user_data_source.dart';
import 'package:bagaicha_florashop/feature/auth/data/model/user_hive_model.dart';
import 'package:bagaicha_florashop/feature/auth/domain/entity/user_entity.dart';

class UserLocalDatasource implements IuserDataSource {
  final HiveService _hiveService;

  UserLocalDatasource({required HiveService hiveService})
    : _hiveService = hiveService;

  Future<void> registerUser(UserEntity userData) async {
    try {
      final userHiveModel = UserHiveModel.fromEntity(userData);
      await _hiveService.register(userHiveModel);
    } catch (e) {
      throw Exception("Registration Failed: $e");
    }
  }

  Future<String> loginUser(String username, String password) async {
    try {
      final user = await _hiveService.loginUser(username, password);
      if (user == null) {
        throw Exception('Invalid email or password');
      }
      return user.userId ?? '';
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
