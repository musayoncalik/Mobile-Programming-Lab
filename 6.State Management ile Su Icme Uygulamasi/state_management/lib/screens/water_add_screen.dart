import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/water_tracker_model.dart';
import 'package:state_management/screens/log_screen.dart';

class WaterAddScreen extends StatelessWidget {
  const WaterAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: const Text("Su İçme"),
        actions: [
          IconButton(
              onPressed: () => navigate(context), icon: const Icon(Icons.list))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Dikey eksende ortalama
        crossAxisAlignment: CrossAxisAlignment.center, // Yatay eksende ortalama
        children: [
          const Text("Su içmek için tıklayınız"),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () => getTime(context), child: const Text("Su İçtim")),
        ],
      )),
    );
  }

  getTime(BuildContext context) {
    final currentTime = TimeOfDay.now().format(context);
    Provider.of<WaterTrackerModel>(context, listen: false).addLog(currentTime);
  }

  navigate(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LogScreen()));
  }
}
