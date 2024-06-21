import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, Loginstates> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(Loginstates()) {
    on<LoginInitEvent>((event, emit) => {
          emit(state.copyWith(
            formKey: formKey,
          ))
        });

    on<EmailChanged>((event, emit) => {
          emit(state.copyWith(
            email: event.email,
          ))
        });

    on<PasswordChanged>((event, emit) => {
          emit(state.copyWith(
            password: event.password,
          ))
        });

        on<FormSubmit>((event, emit) {
         print('Email ${state.email}, Senha ${state.password}');
        });
  }
}
