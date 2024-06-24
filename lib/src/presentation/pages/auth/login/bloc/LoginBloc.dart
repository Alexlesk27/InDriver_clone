import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, Loginstates> {
  final formKey = GlobalKey<FormState>();

  LoginBloc() : super(Loginstates()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(
        formKey: formKey,
      ));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocformItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? ' Insira o email' : null),
          formKey: formKey));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlocformItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? 'Insira o password'
              : event.password.value.length < 6
                  ? 'A senha deve conter 6 caracteres'
                  : null,
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) {
      print(
        'Email ${state.email.value}, Senha ${state.password.value}',
      );
    });
  }
}
