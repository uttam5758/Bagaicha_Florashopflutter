import 'package:bagaicha_florashop/app/use_case/use_case.dart';
import 'package:bagaicha_florashop/core/error/failure.dart';
import 'package:bagaicha_florashop/feature/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class LoginUsecaseParams extends Equatable {
  final String username;
  final String password;

  const LoginUsecaseParams({required this.username, required this.password});

  const LoginUsecaseParams.initial() : username = '', password = '';

  @override
  List<Object?> get props => [username, password];
}

class UserLoginUsecase
    implements UsecaseWithParams<String, LoginUsecaseParams> {
  final IuserRepository _userRepository;

  UserLoginUsecase({required IuserRepository userRepository})
    : _userRepository = userRepository;

  @override
  Future<Either<Failure, String>> call(LoginUsecaseParams params) {
    return _userRepository.loginUser(params.username, params.password);
  }
}
