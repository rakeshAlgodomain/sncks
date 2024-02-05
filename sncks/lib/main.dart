import 'package:flutter/material.dart';
import 'package:sncks/firebase_options.dart';
import 'package:sncks/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",

      theme: ThemeData(
        primarySwatch: Colors.blue
      ),

      home: const LoginPage(),
    );
  }
}