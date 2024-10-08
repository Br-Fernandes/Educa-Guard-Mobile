import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Conversas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.system_security_update_warning_outlined),
      ),
      body: const Center(
        child: Text(
          "Alguma conversa aqui",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
