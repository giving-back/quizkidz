// Flutter imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizkidz/wrappers/auth_wrapper.dart';
import 'firebase_options.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    FirebaseFirestore.instance.useFirestoreEmulator(
      Platform.isAndroid ? '10.0.2.2' : 'localhost',
      8080,
    );
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz Kidz",
      home: Scaffold(
        body: SafeArea(
          child: AuthWrapper(),
        ),
      ),
    );
  }
}
