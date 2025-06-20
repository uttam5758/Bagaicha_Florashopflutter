import 'package:bagaicha_florashop/app/constant/hive_table_constant.dart';
import 'package:bagaicha_florashop/feature/auth/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String confirmpassword;

  UserHiveModel({
    String? userId,
    required this.email,
    required this.password,
    required this.confirmpassword,
  }) : userId = userId ?? const Uuid().v4();

  const UserHiveModel.intial()
    : userId = '',
      email = '',
      password = '',
      confirmpassword = '';

  factory UserHiveModel.fromEntity(UserEntity entity) {
    return UserHiveModel(
      userId: entity.userId,
      email: entity.email,
      password: entity.password,
      confirmpassword: entity.confirmpassword,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      password: password,
      confirmpassword: confirmpassword,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [userId, email, password, confirmpassword];
}
