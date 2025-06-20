import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String email;
  final String password;
  final String confirmpassword;

  const UserEntity({
    this.userId,
    required this.email,
    required this.password,
    required this.confirmpassword,
  });

  @override
  List<Object?> get props => [userId, email, password, confirmpassword];
}
