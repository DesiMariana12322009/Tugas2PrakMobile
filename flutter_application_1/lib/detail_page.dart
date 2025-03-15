import 'package:flutter/material.dart';

class HalamanDetail extends StatelessWidget {
  final String kategori;

  HalamanDetail({required this.kategori});

  String deskripsiKategori() {
    switch (kategori) {
      case 'Kurus':
        return 'Anda termasuk kurus. Pertimbangkan pola makan seimbang dan nutrisi yang cukup.';
      case 'Berat badan normal':
        return 'Bagus! Berat badan Anda berada dalam kategori normal.';
      case 'Kelebihan berat badan':
        return 'Anda kelebihan berat badan. Coba rutin berolahraga dan menjaga pola makan sehat.';
      case 'Obesitas':
        return 'Anda berada dalam kategori obesitas. Disarankan berkonsultasi dengan tenaga kesehatan.';
      default:
        return 'Informasi tidak tersedia.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // Background pink muda
      appBar: AppBar(
        title: Text('Detail Kategori BMI'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Container(
          width: 280, // Lebih kecil
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0), // Persegi (tidak melengkung)
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Kategori: $kategori',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                deskripsiKategori(),
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
