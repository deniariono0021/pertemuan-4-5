import 'package:flutter/material.dart';
import 'menu.dart';
import 'pesan_page.dart';

//ignore: must_be_immutable
class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  List<Menu> listMenu = [];
  void dummyMenu() {
    listMenu.add(Menu(
        nama: 'Blume Cocktail',
        deskripsi: "Cocktail Zeeger",
        harga: 20000,
        gambar: 'blume_1.jpg'));
    listMenu.add(Menu(
        nama: "Oseng Asu",
        deskripsi: "Oseng Oseng daging asu",
        harga: 15000,
        gambar: 'sengsu_1.jpg'));
    listMenu.add(Menu(
        nama: "Steak",
        deskripsi: "Steak Sapi Wahyu A5",
        harga: 18000,
        gambar: 'steak_1.jpg'));
    listMenu.add(Menu(
        nama: "Takoyaki",
        deskripsi: "Takoyaki Berbagai Macam Isian",
        harga: 25000,
        gambar: 'takoyaki_1.jpg'));
    listMenu.add(Menu(
        nama: "Es Jeruk",
        deskripsi: "Es Jeruk Fresh Zeeeger",
        harga: 3000,
        gambar: 'jeruk_1.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    dummyMenu();

    return Scaffold(
        appBar: AppBar(title: Text('Aplikasi Menu Makanan')),
        body: Column(children: [
          const SizedBox(
            width: double.infinity,
            child: Text("Pilih Menu"),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listMenu.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading:
                        Image.asset('assets/images/${listMenu[index].gambar}'),
                    title: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(listMenu[index].nama)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listMenu[index].deskripsi),
                        Text("Rp. ${listMenu[index].harga}")
                      ],
                    ),
                    trailing: ElevatedButton(
                      child: const Text("Pesan"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PesanPage(pesananMenu: listMenu[index])));
                      },
                    ),
                  );
                }),
          )
        ]));
  }
}
