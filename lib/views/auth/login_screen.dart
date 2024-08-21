import 'package:educa_guardia/views/menu_screen.dart';
import 'package:educa_guardia/views/recognition_screen.dart';
import 'package:educa_guardia/views/widgets/CircleBackground.dart';
import 'package:educa_guardia/controllers/auth_controller.dart';
import 'package:educa_guardia/views/recover_account_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    void _showDialog(String title, String content) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: CircleBackground(
              numberOfCircles: 2,
              colors: [
                Colors.blue,
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/Logo_SimplesBranca.png",
                width: 160,
              ),
              Padding(
                padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Insira seu Usuário',
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                            prefixIcon: Icon(Icons.person_2_rounded),
                            prefixIconColor: Colors.black,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Insira sua Senha',
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(15)),
                            ),
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.black,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RecoverAccountScreen()));
                              },
                              child: const Text(
                                "Esqueceu a senha?",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                      if (!isKeyboardVisible)
                        SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                var output = await AuthController.loginUser(
                                  _usernameController.text,
                                  _passwordController.text,
                                );

                                if (output != null) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MenuScreen(user: output)),
                                  );
                                } else {
                                  throw Exception("Login falhou");
                                }
                              } catch (e) {
                                _showDialog("Erro", "Insira as informações de login!");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 10,
                              shadowColor: Colors.black.withOpacity(1),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (!isKeyboardVisible)
            Positioned(
              bottom: 22,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecognitionScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9))),
                    child: const Text(
                      "Sou Aluno",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (isKeyboardVisible)
            Positioned(
              bottom: 22,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            var output = await AuthController.loginUser(
                                _usernameController.text,
                                _passwordController.text);

                            if(output != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MenuScreen(user: output)),
                              );
                            }
                          } catch (e) {
                            _showDialog("Erro", "Usuário ou senha incorretos!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromRGBO(7, 98, 217, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const RecognitionScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromRGBO(7, 98, 217, 1.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9))),
                        child: const Text(
                          "Sou Aluno",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
