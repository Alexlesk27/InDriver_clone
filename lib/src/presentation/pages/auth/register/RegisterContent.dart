import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/widgets/DefaultBottom.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/widgets/DefaultTextField.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/widgets/DefaultTextFieldOutlined.dart';

class Registercontent extends StatelessWidget {
  const Registercontent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [Colors.black, Colors.blue])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25)
              ],
            ),
          ),
          
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color.fromARGB(255, 248, 247, 247), Color.fromARGB(255, 170, 178, 185)],
              ),
            ),
            child: Stack(
              children: [
                 _imageBannerBackground(context),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaultTextFieldOutlined(
                          text: "Nome",
                          icon: Icons.person_outline,
                          margin: EdgeInsets.only(left: 50, right: 50, top: 50)),
                      DefaultTextFieldOutlined(
                        text: "Apelido",
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        text: "Email",
                        icon: Icons.email_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        text: "Telefone",
                        icon: Icons.phone_outlined,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        text: "Senha",
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        text: "Confime sua senha",
                        icon: Icons.lock_outline,
                        margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                      ),
                      DefaultBottom(
                        text: "Criar usuário",
                        font: 18,
                        cor: Colors.blue,
                        fontWeight: FontWeight.bold,
                        click: () {},
                        backgroundColor: Colors.white,
                        margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _separatorOr(),
                      SizedBox(
                        height: 10,
                      ),
                      _textIAlreadyHaveAccount(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textIAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Já tem conta?",
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  Widget _imageBannerBackground(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.4),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          "Login",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        "Registro",
        style: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Image.asset('assets/img/delivery.png'),
      width: 180,
      height: 180,
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'Ou',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }
}
