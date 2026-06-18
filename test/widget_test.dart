import 'package:flutter_test/flutter_test.dart';
import 'package:basquete_pontos/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}