import 'package:educa_guardia/models/login_output.dart';
import 'package:educa_guardia/views/widgets/menu_icons.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final LoginOutput user;

  const MenuScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String title = '';
    List<Widget> firstIcons = [];
    List<Widget> secondIcons = [];

    if (user.role == 'ROLE_ADMIN') {
      title = 'Gestor';
      firstIcons = [const HomeIcon(), const ReportIcon()];
      secondIcons = [const MessagesIcon(), const EmergencyIcon()];
    } else if (user.role == 'ROLE_PROFESSOR') {
      title = 'Professor';
      firstIcons = [const HomeIcon(), const PresenceListIcon()];
      secondIcons = [const MessagesIcon()];
    } else if (user.role == 'ROLE_OPERADOR_MONITORAMENTO') {
      title = 'Operador de Monitoramento';
      firstIcons = [const HomeIcon(), const MonitoringIcon()];
      secondIcons = [const MessagesIcon()];
    } else if (user.role == 'ROLE_SEGURANCA') {
      title = 'Segurança';
      firstIcons = [const HomeIcon(), const MessagesIcon()];
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/images/woman.png",
              width: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            Text('Bem vindo $title')
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.black,
            size: 25,
          ),
          SizedBox(width: 15,)
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/menu.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: firstIcons,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: secondIcons,
            ),
          ],
        ),
      ),
    );
  }
}
