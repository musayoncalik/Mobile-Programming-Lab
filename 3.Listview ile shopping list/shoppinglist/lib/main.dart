import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Stateless Widget durağan bir sayfa, değişemeyen içerikler
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShoppingListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//statefull widget değişebilen, güncellenebilen, etkileşime girilebilen sayfa
class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

//değişebilen bir nesne olarak görünüyor
class _ShoppingListScreenState extends State<ShoppingListScreen> {
  //_tasks adında liste oluşturma
  final List<String> _tasks = [];
  final TextEditingController _controller =
      TextEditingController(); //görev eklemek için kullanılan metin kutusunun (TextField) içeriğini kontrol etmek için kullanılır

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //properties camelCase ; widgetlar PascalCase ile yazılıyo
      appBar: AppBar(
        title: const Text("Alışveriş Listesi",
            style: TextStyle(
                color: Colors.white)), //text rengi beyaz olarak ayarlandı
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    labelText: "Ne Alacaksınız", border: OutlineInputBorder()),
                controller: _controller,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: _addTask, child: const Text("ekle")),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  // ListView’in mevcut alanı doldurmasını sağlayan widget’tır böylece listeye istediğimiz kadar öğe girebiliriz.
                  child: ListView.builder(
                      //Liste öğelerini dinamik olarak oluşturmak için kullanılır.
                      itemCount: _tasks
                          .length, //itemCount: Listede kaç öğe olacağını belirtir (burada _tasks.length kullanılır).
                      itemBuilder: (context, index) {
                        //itemBuilder: Liste öğelerinin nasıl görüneceğini belirler. Her öğe için bir ListTile oluşturulur.
                        return ListTile(
                          //ListTile: Tek bir liste öğesini temsil eder.
                          title: Text(
                              _tasks[index]), //title: Öğenin adını görüntüler
                          trailing: IconButton(
                              //trailing: Sağ tarafta, öğe silme işlemi için bir IconButton gösterir. IconButton: Silme butonunun işlevini tanımlar.
                              onPressed: () {
                                //onPressed: Butona basıldığında ilgili görevi listeden çıkarır.
                                setState(() {
                                  //setState() çağrılarak arayüz güncellenir
                                  _tasks.removeAt(
                                      index); //görevi listeden çıkarma
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        );
                      }))
            ], //children
          )),
    );
  }

  //görev ekleme fonksiyonu
  void _addTask() {
    if (_controller.text.isNotEmpty) {
      //metin boş değilse çalışır
      setState(() {
        //fonksiyonu, state’in değiştiğini bildirir ve arayüzü günceller.

        _tasks.add(_controller
            .text); //Kullanıcının metin kutusuna girdiği içerik, _tasks listesine eklenir.
      });
      _controller
          .clear(); //Görev eklendikten sonra, metin kutusunun içeriği temizlenir
    }
  }
}
