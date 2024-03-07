import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/pages/home.dart';

void main() {
  testWidgets('Teste', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HomePage());

    // Verificando se um texto específico é renderizado na tela.
    expect(find.text('Livraria'), findsOneWidget);
  });
}
