import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:englishb2app/app.dart';

void main() {
  testWidgets('App renders onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: LinguaB2App()),
    );

    expect(find.text('B2 Exam Prep'), findsOneWidget);
  });
}
