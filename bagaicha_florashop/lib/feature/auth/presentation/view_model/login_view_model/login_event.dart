import 'package:flutter/material.dart';

@immutable
sealed class LoginEvent {}

class NavigateToRegisterViewEvent extends LoginEvent {
  final BuildContext context;

  NavigateToRegisterViewEvent({required this.context});
}

class NavigateToHomeViewEvent extends LoginEvent {
  final BuildContext context;

  NavigateToHomeViewEvent({required this.context});
}

class LoginWithuserNameAndPasswordEvent extends LoginEvent {
  final BuildContext context;
  final String username;
  final String password;

  LoginWithuserNameAndPasswordEvent({
    required this.context,
    required this.username,
    required this.password,
  });
}
