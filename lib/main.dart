import 'package:flutter/material.dart';

import 'package:goledz_controller/pattern_selector.dart';

void main() {
  runApp(const GoLEDzController());
}

class GoLEDzController extends StatelessWidget {
  const GoLEDzController({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoLEDz Controller',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const PatternSelector(),
    );
  }
}