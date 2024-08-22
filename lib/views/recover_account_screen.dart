import 'package:educa_guardia/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class RecoverAccountScreen extends StatefulWidget {
  @override
  _RecoverAccountScreenState createState() => _RecoverAccountScreenState();
}

class _RecoverAccountScreenState extends State<RecoverAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira seu e-mail';
    }
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, insira um e-mail válido';
    }
    return null;
  }

  void _validateAndSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      try {
        await AuthController.recoveryPassword(email);
        _showDialog('Sucesso!', 'Email de recuperação enviado com sucesso.');
      } catch (e) {
        _showDialog('Erro!', 'Email não cadastrado!');
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 98, 217, 1.0),
        title: Image.asset(
          'assets/images/Logo_SimplesBranca.png',
          width: 115,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Recuperação de Senha',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Digite seu email para recuperar sua senha',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 9,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Insira seu Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    prefixIcon: Icon(Icons.email_rounded),
                    prefixIconColor: Colors.black,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                ),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: _validateAndSubmit,
                    style: ElevatedButton.styleFrom(
                      elevation: 8.0,
                    ),
                    child: const Text(
                      "Recuperar",
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
      ),
    );
  }
}
