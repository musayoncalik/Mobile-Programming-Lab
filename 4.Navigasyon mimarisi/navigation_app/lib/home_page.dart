import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //ekranda taşmayı önlemek için saat wifi işaretini kapatmamak için
    return SafeArea(
        //ana iskelet body gibi
        child: Scaffold(
      //widget koyulan yer
      appBar: AppBar(
        title: const Text("Mobil Uygulamam", //textin stylını değiştiriyoz
            style: TextStyle(fontSize: 30, color: Colors.white)),
        centerTitle: true, //ortalama = true
        backgroundColor: Colors.indigo, //arkaplan rengi = Indigo
      ),
      //drawer ile seçenek çubuğu eklendi
      drawer: Drawer(
          //ListView aşağı doğru kaydırmayı sağlıyo sınırsız liste yazma gibi
          child: ListView(
        children: [
          //listenin başlığı gibi bişey
          DrawerHeader(
              child: Container(
            color: Colors.indigo,
            //yazıları yan yana yazma children içine yazılıyo
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ikon ekledik ve style ayarladık
                Icon(
                  Icons.account_circle,
                  size: 40,
                  color: Colors.white,
                ),
                //text ekledik ve style ayarladık
                Text(
                  "Kullanıcı Adı",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )
              ],
            ),
          )),
          //başlıktan sonra devam ediliyo burda
          myMenuItem(Icons.home, "Ana Sayfa", "/home_page"),
          myMenuItem(Icons.notifications, "Bildirimler", "/notifications_page"),
          myMenuItem(Icons.accessibility, "Hakkında", "/about_page"),
        ],
      )),

      body: const Center(
        child: Text("Ana Sayfadasınız"),
      ),
    ));
  }

  Widget myMenuItem(IconData myIcon, String myTitle, String myRoute) =>
      ListTile(
          leading: (Icon(
            myIcon,
            color: Colors.black,
          )),
          title: Text(
            myTitle,
            style: const TextStyle(fontSize: 20),
          ),
          trailing: const Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, myRoute);
          });
}
