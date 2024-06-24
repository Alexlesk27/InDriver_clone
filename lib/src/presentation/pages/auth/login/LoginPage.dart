// ignore: file_names
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginStates.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 68, 255, 162),
      body: BlocBuilder<LoginBloc, Loginstates>(
      builder: (context, state) {
        return LoginContent(state);
      },
    ));
  }
}
