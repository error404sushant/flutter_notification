import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notification/features/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
}