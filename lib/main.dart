import 'package:flutter/material.dart';
import 'package:onbording_screen/onboarding/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ON BORDING SCREEN',
      theme: ThemeData.light(useMaterial3: true),
      home:  const Onboarding(),
    );
  }
}