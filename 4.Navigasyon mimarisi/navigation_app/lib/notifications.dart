import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bildirimler"),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(
        child: Text("Bildirimler Sayfasındasınız"),
      ),
    ));
  }
}
