import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    final isValidEmail = emailRegExp.hasMatch(email);

    if (password.length > 8 && isValidEmail) {
      emit(LoginLoading());

      Timer(Duration(seconds: 2), () {
        emit(LoginSuccess());
      });
    } else {
      emit(LoginError('Invalid email or password'));
    }
  }
}
