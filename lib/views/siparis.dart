import 'package:flutter/material.dart';
import 'package:flutter_yemek_uygulamasi/yemek_sinifi.dart';

class Siparis extends StatefulWidget {
  Yemekler yemek;
  Siparis({required this.yemek, Key? key}) : super(key: key);

  @override
  State<Siparis> createState() => _SiparisState();
}

class _SiparisState extends State<Siparis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset("images/${widget.yemek.yemekResimAdi}"),
                Text(
                  widget.yemek.yemekAdi,
                  style: TextStyle(fontSize: 25, color: Colors.red[300]),
                ),
              ],
            ),
            Text(
              "${widget.yemek.yemekFiyat} \u{20BA}",
              style: TextStyle(fontSize: 35, color: Colors.blue[300]),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                    content:
                        Text("${widget.yemek.yemekAdi} Siparisiniz Verildi"),
                  ),
                );
              },
              child: const Text(
                "Siparis Ver",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
