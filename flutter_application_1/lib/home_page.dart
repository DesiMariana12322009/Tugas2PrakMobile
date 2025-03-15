import 'package:flutter/material.dart';
import 'result_page.dart';
import 'login_page.dart';

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final TextEditingController beratController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();

  @override
  void dispose() {
    beratController.dispose();
    tinggiController.dispose();
    super.dispose();
  }

  void hitungBMI() {
    if (beratController.text.isNotEmpty && tinggiController.text.isNotEmpty) {
      try {
        double berat = double.parse(beratController.text);
        double tinggi = double.parse(tinggiController.text) / 100;
        double bmi = berat / (tinggi * tinggi);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HalamanHasil(bmi: bmi),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Masukkan angka yang valid')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Harap isi kedua kolom')),
      );
    }
  }

  void keluar() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HalamanLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // Background pink muda
      appBar: AppBar(
        title: Text('Kalkulator BMI'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: keluar,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 320, // Lebih besar dari sebelumnya (dulu 280)
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8), // Sudut sedikit membulat
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hitung BMI",
                style: TextStyle(
                  fontSize: 22, // Sedikit lebih besar
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: beratController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Berat Badan (kg)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi Badan (cm)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                  ),
                ),
              ),
              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 14), // Tombol lebih besar
                  ),
                  onPressed: hitungBMI,
                  child: Text(
                    'Hitung BMI',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
