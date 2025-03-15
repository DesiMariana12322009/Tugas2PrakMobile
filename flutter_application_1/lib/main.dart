import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(AplikasiBMI());
}

class AplikasiBMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator BMI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HalamanLogin(),
    );
  }
}
