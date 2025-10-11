import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/water_tracker_model.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final waterLog = Provider.of<WaterTrackerModel>(context).waterLog;
    return Scaffold(
      appBar: AppBar(
        title: const Text("İçilen Su Saatleri"),
      ),
      //ListView.builder yerine ListView.separated ekledim aralarda boşluk bırakmayı sağlıyor
      body: ListView.separated(
        itemCount: waterLog.length,
        //bu fazlalık bir şey indexler arasına SizedBox koylaya yarıyor
        separatorBuilder: (context, index) =>
            const SizedBox(height: 10), // Aralık ekliyor
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: const Color.fromARGB(255, 204, 201, 201),
            leading: const Icon(Icons.local_drink),
            title: Text("Saat : ${waterLog[index]}"),
            trailing: IconButton(
              onPressed: () {
                removeButton(context, index);
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }

  removeButton(BuildContext context, int index) {
    Provider.of<WaterTrackerModel>(context, listen: false).removeLog(index);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Veri Silindi")));
  }
}
