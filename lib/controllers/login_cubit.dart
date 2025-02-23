import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (username == "admin" && password == "password") {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure("Invalid username or password"));
    }
  }
}
