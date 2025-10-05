import 'package:flutter/material.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("Ilk Uygulamam"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
        leading: const Text("Menü"),
      ),
      body: const Center(child: Text("İsa Musa Sen Bizi Kutsa")),
    ));
  }
}
