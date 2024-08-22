import 'package:educa_guardia/views/chat.dart';
import 'package:educa_guardia/views/emergency_calls_screen.dart';
import 'package:educa_guardia/views/incidents_report_screen.dart';
import 'package:educa_guardia/views/monitoring_screen.dart';
import 'package:educa_guardia/views/presence_screen.dart';
import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Icons.home_filled,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Início',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ReportIcon extends StatelessWidget {
  const ReportIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IncidentsReportScreen()),
              );
            },
            icon: const Icon(
              Icons.table_view_sharp,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Relatório',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MessagesIcon extends StatelessWidget {
  const MessagesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Chat()),
              );
            },
            icon: const Icon(
              Icons.message_outlined,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Mensagens',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class EmergencyIcon extends StatelessWidget {
  const EmergencyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyCallsScreen()),
              );
            },
            icon: const Icon(
              Icons.phone,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Emergência',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class MonitoringIcon extends StatelessWidget {
  const MonitoringIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MonitoringScreen()),
              );
            },
            icon: const Icon(
              Icons.monitor,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Monitoramento',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class PresenceListIcon extends StatelessWidget {
  const PresenceListIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PresenceScreen()),
              );
            },
            icon: const Icon(
              Icons.person,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        const Text(
          'Lista de Presença',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
