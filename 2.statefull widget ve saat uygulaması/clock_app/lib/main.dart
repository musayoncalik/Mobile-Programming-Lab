import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //arka planda çalışan daha az bellek harcayan widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ClockWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ClockWidget extends StatefulWidget {
  //etkileşim yapılacaksa buton vs. statefulWidget kullanılıyo
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  // saat dakika ve saniye için güncel değerleri alıp değişkenlere atama
  var saat = DateTime.now().hour;
  var dakika = DateTime.now().minute;
  var saniye = DateTime.now().second;
  bool showTime = false; //başlangıçta zaman gösterilmeyecek
  Future<void> fetchTime() async {
    //yeni değeri yazma yani saati güncelleme
    setState(() {
      showTime = true; // saati gösteriyo
      saat = DateTime.now().hour;
      dakika = DateTime.now().minute;
      saniye = DateTime.now().second;
    });
    //3 saniye göster sonra geri kapat
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showTime = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          //başlık
          title: const Text("Saat Uygulaması"),
          //ortalama
          centerTitle: true,
          //arka plan rengi
          backgroundColor: Colors.deepOrange,
        ),
        //body kısmı
        body: Center(
          //birden fazla işlem yapabilmek için column
          child: Column(
            //nesneleri ortalama
            mainAxisAlignment: MainAxisAlignment.center,
            //children ile birden fazla widgeti bir dizi halinde alma
            children: [
              //ShowTime değeri true ile saat dakika ve saniyeyi yazdırma
              if (showTime) Text("$saat:$dakika:$saniye"),
              //button
              ElevatedButton(
                  //tıklandığında
                  onPressed: fetchTime,
                  child: Text("Saat Kaç?"))
            ],
          ),
        ),
      ),
    );
  }
}
