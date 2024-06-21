import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Loginstates extends Equatable {
 
  final String email;
  final String password;
   final GlobalKey<FormState>? formKey;

  const Loginstates({this.email = " ", this.password = " ", this.formKey});


  Loginstates copyWith({
    String? email,
    String? password,
    GlobalKey<FormState>? formKey
  }){
    return Loginstates(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [
        email,
        password,
      ];
}
