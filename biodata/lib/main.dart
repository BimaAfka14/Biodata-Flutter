import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Katou (Megumi)';
    biodata['email'] = 'megumi@saenai.com';
    biodata['phone'] = '+628811223344';
    biodata['image'] = 'megumi.jpg';
    biodata['hobby'] = 'Menggambar Manga';
    biodata['addr'] = 'Jln.Pedirikan Kidul';
    biodata['desc'] =
        '''Katou Megumi adalah karakter fiksi dari seri light novel dan anime "Saenai Heroine no Sodatekata" (How to Raise a Boring Girlfriend) karya Fumiaki Maruto. Megumi digambarkan sebagai gadis yang pendiam, tenang, dan sering kali tidak menonjol di sekitarnya. Dia adalah teman sekelas protagonis, Tomoya Aki, yang kemudian merekrutnya untuk menjadi inspirasi utama karakter dalam game yang sedang ia kembangkan.''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  btn_contact(Icons.alternate_email, Colors.green[900],
                      "mailto: ${biodata['email']}"),
                  btn_contact(Icons.mark_email_read_rounded, Colors.blueAccent,
                      "https://wa.me/${biodata['phone']}"),
                  btn_contact(
                      Icons.phone, Colors.deepPurple, "tel:${biodata['phone']}")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textAttribute("Hobby", biodata['hobby'] ?? ''),
              textAttribute("Alamat", biodata['addr'] ?? ''),
              SizedBox(
                height: 10,
              ),
              teksKotak(Colors.black38, 'Deskrispi'),
              SizedBox(
                height: 10,
              ),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container teksKotak(Color bgcolor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgcolor),
      child: Text(teks,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            "- $judul",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Text(
          ":",
          style: TextStyle(fontSize: 18),
        ),
        Text(teks, style: TextStyle(fontSize: 18))
      ],
    );
  }

  Expanded btn_contact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
