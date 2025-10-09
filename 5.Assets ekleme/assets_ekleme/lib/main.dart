import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Itim"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Kırpık"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/gucsuz.gif"),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Image(
                image: NetworkImage("https://picsum.photos/200/300.jpg"),
              ),
              Text(
                "Uygulamaya Hoş Geldiniz",
                style: TextStyle(fontFamily: "Itim", fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
