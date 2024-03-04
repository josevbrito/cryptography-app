import 'package:flutter_test/flutter_test.dart';
import 'package:library_app/home/home.dart';

void main() {
  testWidgets('Teste de renderização do widget MyApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HomePage());

    // Verificando se um texto específico é renderizado na tela.
    expect(find.text('Livraria'), findsOneWidget);
  });
}
