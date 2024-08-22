import 'package:educa_guardia/views/auth/login_screen.dart';
import 'package:educa_guardia/views/chat.dart';
import 'package:educa_guardia/views/monitoring_screen.dart';
import 'package:educa_guardia/views/presence_screen.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await FaceCamera.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EducaGuardIA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
    );
  }
}