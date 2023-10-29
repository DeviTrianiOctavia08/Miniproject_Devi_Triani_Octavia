import 'package:bacaan_sholat/pages/ayat_kursi_page.dart';
import 'package:bacaan_sholat/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pages/main_page.dart';

void main() {
  testWidgets('halaman Ayat Kursi', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AyatKursi(),
    ));

    expect(find.text('Ayat Kursi'), findsOneWidget);
});
}