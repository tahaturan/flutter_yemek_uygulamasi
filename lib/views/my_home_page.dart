import 'package:flutter/material.dart';
import 'package:flutter_yemek_uygulamasi/views/siparis.dart';
import 'package:flutter_yemek_uygulamasi/yemek_sinifi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Yemekler>> yemekleriGetir() async {
    List<Yemekler> yemekListesi = [];

    var yemek1 = Yemekler(
        yemekId: 1,
        yemekAdi: "Kofte",
        yemekFiyat: 15,
        yemekResimAdi: "kofte.png");
    var yemek2 = Yemekler(
        yemekId: 2,
        yemekAdi: "Ayran",
        yemekFiyat: 2,
        yemekResimAdi: "ayran.png");
    var yemek3 = Yemekler(
        yemekId: 3,
        yemekAdi: "Baklava",
        yemekFiyat: 25,
        yemekResimAdi: "baklava.png");
    var yemek4 = Yemekler(
        yemekId: 4,
        yemekAdi: "Kadayif",
        yemekFiyat: 15,
        yemekResimAdi: "kadayif.png");
    var yemek5 = Yemekler(
        yemekId: 5,
        yemekAdi: "Makarna",
        yemekFiyat: 15,
        yemekResimAdi: "makarna.png");
    var yemek6 = Yemekler(
        yemekId: 6,
        yemekAdi: "Fanta",
        yemekFiyat: 15,
        yemekResimAdi: "fanta.png");
    yemekListesi.add(yemek1);
    yemekListesi.add(yemek2);
    yemekListesi.add(yemek3);
    yemekListesi.add(yemek4);
    yemekListesi.add(yemek5);
    yemekListesi.add(yemek6);
    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnaSayfa'),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Yemekler> yemekler = snapshot.data;
            return ListView.builder(
              itemCount: yemekler.length,
              itemBuilder: (BuildContext context, int index) {
                var yemek = yemekler[index];
                return Card(
                  elevation: 10,
                  shadowColor: Colors.green,
                  child: ListTile(
                    leading: Image.asset("images/${yemek.yemekResimAdi}"),
                    title: Text(yemek.yemekAdi),
                    subtitle: Text("${yemek.yemekFiyat} \u{20BA}"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Siparis(yemek: yemek),
                            ));
                      },
                      icon: const Icon(Icons.add),
                    ),
                    contentPadding: const EdgeInsets.all(32.0),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Veriler Gelemedi"),
            );
          }
        },
      ),
    );
  }
}
