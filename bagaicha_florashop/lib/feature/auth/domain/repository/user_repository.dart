import 'package:bagaicha_florashop/core/error/failure.dart';
import 'package:bagaicha_florashop/feature/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract interface class IuserRepository {
  Future<Either<Failure, void>> registerUser(UserEntity user);

  Future<Either<Failure, String>> loginUser(String username, String password);
}
