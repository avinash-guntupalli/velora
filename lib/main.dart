import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:velora/screens/elder_main_screen_voice.dart';
import 'package:velora/screens/explain_task.dart';
import 'package:velora/screens/explain_task_map.dart';
import 'package:velora/screens/feedback_screen.dart';
import 'package:velora/screens/login_screen.dart';
import 'package:velora/screens/login_with_voice.dart';
import 'package:velora/screens/map_screen.dart';
import 'package:velora/screens/payment_screen_photo.dart';
import 'package:velora/screens/register_screen.dart';
import 'package:velora/screens/register_screen_final.dart';
import 'package:velora/screens/register_with_voice.dart';
import 'package:velora/screens/student_welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: 'https://xpgwpaaretydmoiqxurc.supabase.co',
  //   anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhwZ3dwYWFyZXR5ZG1vaXF4dXJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjAxMjcyMTYsImV4cCI6MjAzNTcwMzIxNn0.m8RQwuCdgcfarLn5KoLQJoa-U5g-2qDV5CHKin2ChRU',
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreenVoice(),
    );
  }
}