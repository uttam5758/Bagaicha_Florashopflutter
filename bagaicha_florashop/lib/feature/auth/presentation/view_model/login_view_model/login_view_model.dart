import 'package:bagaicha_florashop/app/service_locator/service_locator.dart';
import 'package:bagaicha_florashop/core/common/my_snackbar.dart';
import 'package:bagaicha_florashop/feature/auth/domain/use_case/user_login_usecase.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view/sign_up.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/login_view_model/login_event.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/login_view_model/login_state.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:bagaicha_florashop/screens/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Bloc<LoginEvent, LoginState> {
  final UserLoginUsecase _userLoginUsecase;

  LoginViewModel(this._userLoginUsecase) : super(LoginState.initial()) {
    on<NavigateToRegisterViewEvent>(_onNavigateToRegisterView);
    on<LoginWithuserNameAndPasswordEvent>(_onLoginWithEmailAndPassword);
    on<NavigateToHomeViewEvent>(_onNavigateToHomeView);
  }

  void _onNavigateToRegisterView(
    NavigateToRegisterViewEvent event,
    Emitter<LoginState> emit,
  ) {
    if (event.context.mounted) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder:
              (context) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: serviceLocator<RegisterViewModel>(),
                  ),
                ],
                child: SignupScreen(),
              ),
        ),
      );
    }
  }

  void _onNavigateToHomeView(
    NavigateToHomeViewEvent event,
    Emitter<LoginState> emit,
  ) {
    if (event.context.mounted) {
      Navigator.push(
        event.context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    }
  }

  void _onLoginWithEmailAndPassword(
    LoginWithuserNameAndPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await _userLoginUsecase(
      LoginUsecaseParams(username: event.username, password: event.password),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: 'Invalid credentials. Please try again.',
          color: Colors.red,
        );
      },
      (token) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "Login Successful",
          color: Colors.green,
        );

        // Optional: Navigate to Home after login
        add(NavigateToHomeViewEvent(context: event.context));
      },
    );
  }
}
