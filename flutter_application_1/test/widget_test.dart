import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/result_page.dart';

void main() {
  testWidgets('Uji Tampilan Halaman Login', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HalamanLogin()));

    expect(find.text('Masuk'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Uji Tampilan Halaman Utama', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HalamanUtama()));

    expect(find.text('Kalkulator BMI'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Uji Tampilan Halaman Hasil', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HalamanHasil(bmi: 22.0)));

    expect(find.textContaining('BMI Anda:'), findsOneWidget);
    expect(find.textContaining('Kategori:'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });
}
