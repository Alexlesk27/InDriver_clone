import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class Loginstates extends Equatable {
  final BlocformItem email;
  final BlocformItem password;
  final GlobalKey<FormState>? formKey;

  const Loginstates({
    this.email = const BlocformItem(error: 'Digite seu email'),
    this.password = const BlocformItem(error: 'Digite sua senha'),
    this.formKey,
  });

  Loginstates copyWith(
      {BlocformItem? email,
      BlocformItem? password,
      GlobalKey<FormState>? formKey}) {
    return Loginstates(
        email: email ?? this.email,
        password: password ?? this.password,
        formKey: formKey);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
      ];
}
