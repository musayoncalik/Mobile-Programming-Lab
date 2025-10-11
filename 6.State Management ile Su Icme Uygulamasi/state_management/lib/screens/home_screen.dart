import 'package:flutter/material.dart';
import 'package:state_management/screens/water_add_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text("Su Takip Uygulaması",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () => navigate(context),
            icon: const Icon(Icons.list, color: Colors.white),
          )
        ],
      ),
      body: const Center(
        child: Text("Su içme uygulamasına hoşgeldiniz"),
      ),
    );
  }

  navigate(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const WaterAddScreen()));
  }
}
