import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginStates.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/widgets/DefaultBottom.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/widgets/DefaultTextField.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:provider/provider.dart';

class LoginContent extends StatelessWidget {
  Loginstates? state;

  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formKey,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.blue]),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated("Login", Colors.white, 30, FontWeight.bold),
                SizedBox(
                  height: 50,
                ),
                _textRegisterRotated(
                    context, "Registro", Colors.white, 24, FontWeight.bold),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.blue],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(25))),
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(right: 15, left: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Bem-vindo",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "De volta....",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        width: 150,
                        height: 150,
                        'assets/img/car_white.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Conecte-se",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DefaultTextfield(
                      text: "Email",
                      onchanged: (text) {
                         context.read<LoginBloc>().add(EmailChanged(email: BlocformItem(value: text)));
                      },
                      validator:(value){
                        return state?.email.error;
                      },
                      icon: Icons.email_outlined,
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                    ),
                    DefaultTextfield(
                      text: "Senha",
                      onchanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(password: BlocformItem(value: text)));
                      },
                      validator:(value){
                        return state?.password.error;
                      },
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      icon: Icons.lock_outlined,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    // Espaçamento entre os campos e o botão
                    DefaultBottom(
                      text: "Entrar",
                      font: 18.0,
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      backgroundColor: Colors.white,
                      cor: Colors.blue,
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        if(state!.formKey!.currentState!.validate()){
                            context.read<LoginBloc>().add(FormSubmit());
                        }else{
                          print("Formulario invalido");
                        }
                     
                      },
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 1,
                          color: Colors.white,
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Text("Ou",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              )),
                        ),
                        Container(
                          width: 20,
                          height: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 20),
                      child: _textDontHaveAccount(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textLoginRotated(
      String text, Color textColor, double font, FontWeight fontWeight) {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontSize: font,
            fontWeight: fontWeight,
          )),
    );
  }

  Widget _textRegisterRotated(BuildContext context, String text,
      Color textColor, double font, FontWeight fontWeight) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: font,
              fontWeight: fontWeight,
            )),
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não tem conta ?",
          style: TextStyle(color: Colors.grey[100], fontSize: 17),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "register");
          },
          child: Text(
            "Registe-se",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )
      ],
    );
  }
}
