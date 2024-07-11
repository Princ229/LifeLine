import 'package:flutter_test/flutter_test.dart';
import 'package:sauve_moi/main.dart';

void main() {
  testWidgets('Test de base de l\'application', (WidgetTester tester) async {
    await tester.pumpWidget(SauveMoiApp());
    expect(find.text('Connexion'), findsOneWidget);
  });
}
