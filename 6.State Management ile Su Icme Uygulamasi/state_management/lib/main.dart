import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/home_screen.dart';
import 'package:state_management/models/water_tracker_model.dart';

void main() {
  //değişiklik var mı yok mu diye arama
  runApp(ChangeNotifierProvider(
    create: (context) => WaterTrackerModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
