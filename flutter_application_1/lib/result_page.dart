import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'home_page.dart';

class HalamanHasil extends StatelessWidget {
  final double bmi;

  HalamanHasil({required this.bmi});

  String kategoriBMI() {
    if (bmi < 18.5) {
      return 'Kurus';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Berat badan normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Kelebihan berat badan';
    } else {
      return 'Obesitas';
    }
  }

  @override
  Widget build(BuildContext context) {
    String kategori = kategoriBMI();
    return Scaffold(
      backgroundColor: Colors.pink[100], // Background pink muda
      appBar: AppBar(
        title: Text('Hasil BMI'),
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
                'BMI Anda: ${bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kategori: $kategori',
                style: TextStyle(fontSize: 18, color: Colors.black87),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HalamanDetail(kategori: kategori),
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Detail',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[300],
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HalamanUtama()),
                    );
                  },
                  child: Text(
                    'Hitung Ulang',
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
