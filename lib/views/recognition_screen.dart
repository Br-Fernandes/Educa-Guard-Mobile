import 'dart:io';
import 'package:educa_guardia/controllers/auth_controller.dart';
import 'package:educa_guardia/views/chat.dart';
import 'package:educa_guardia/views/face_camera_screen.dart';
import 'package:flutter/material.dart';

class RecognitionScreen extends StatefulWidget {
  const RecognitionScreen({super.key});

  @override
  State<RecognitionScreen> createState() => _RecognitionScreenState();
}

class _RecognitionScreenState extends State<RecognitionScreen> {
  bool isCapturing = false;
  File? capturedImage;
  final TextEditingController _usernameController = TextEditingController();

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
        title: const Text('Reconhecimento Facial'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: isCapturing
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (capturedImage == null)
                    Image.asset(
                      'assets/images/foco-da-camera.png',
                      width: 200,
                    )
                  else
                    Image.file(
                      capturedImage!,
                      width: 200,
                    ),
                  const Column(
                    children: [
                      Text(
                        'Digitalizando seu rosto',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Por favor, mantenha seu\n rosto no centro da tela',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 63, 63, 63)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome de usuário',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        final username = _usernameController.text.trim();
                        final result = await Navigator.push<File?>(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FaceCameraScreen()),
                        );

                        //print('Chegou antes do if: $result');
                        if (result != null) {
                          //print('Print depois do if: $result');
                          setState(() {
                            capturedImage = result;
                            isCapturing = false;
                          });

                          // Chama o método de upload no AuthController
                          var isRecognized = await AuthController()
                              .recFacial(username, result);
                          if (isRecognized) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Chat()),
                            );
                          } else {
                            _showDialog("Erro!", "Usuário inexistente ou face não reconhecida!");
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            const Color.fromRGBO(4, 75, 217, 1.0)),
                      ),
                      child: const Text(
                        'Iniciar',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
