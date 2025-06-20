import 'package:bagaicha_florashop/app/use_case/use_case.dart';
import 'package:bagaicha_florashop/core/error/failure.dart';
import 'package:bagaicha_florashop/feature/auth/domain/entity/user_entity.dart';
import 'package:bagaicha_florashop/feature/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUserParams extends Equatable {
  final String username;
  final String email;
  final String password;

  const RegisterUserParams({
    required this.username,
    required this.email,
    required this.password,
  });

  //intial constructor
  const RegisterUserParams.intial({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [username, email, password];
}

class UserRegisterUsecase
    implements UsecaseWithParams<void, RegisterUserParams> {
  final IuserRepository _userRepository;
  UserRegisterUsecase({required IuserRepository userReposiotry})
    : _userRepository = userReposiotry;

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final userEntity = UserEntity(
      userId: "",
      confirmpassword: params.password,
      email: params.email,
      password: params.password,
    );
    return _userRepository.registerUser(userEntity);
  }
}
