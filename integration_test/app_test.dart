import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/view/app.dart';
import 'package:flutter_project/core/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(
    () {
      final FlutterExceptionHandler? originalOnError = FlutterError.onError;
      setUpServiceLocator();

      FlutterError.onError = originalOnError;
    },
  );
  tearDownAll(
    () async {
      await serviceLocator.reset(dispose: true);
    },
  );
  group(
    'kullanıcının kimliği doğrulanmadığında, önce oturum açma ekranına yönlendirilirler.',
    () {
      testWidgets(
        'Kullanıcı yanlış e-posta veya şifre girdiğinde Snackbar da hata mesajı gösterilir.',
        (tester) async {
          await tester.pumpWidget(App()); //pumpWidget metodu widgeti ekrana
          await tester.pumpAndSettle(); // tamamlanması için bekletiyoruz.
          await tester.enterText(
            find.byKey(const Key('username-field')),
            'utsav',
          );
          await tester.enterText(
            find.byKey(const Key('password-field')),
            'passworx',
          );
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('login-button')));
          await tester.pumpAndSettle();
          expect(find.byType(SnackBar), findsOneWidget);
        },
      );
      testWidgets(
        'kullanıcı doğru e-posta ve şifreyi girdiğinde ana ekrana yönlendiriliyor ve ürünler getiriliyor',
        (tester) async {
          await tester.pumpWidget(App());
          await tester.pumpAndSettle();
          await tester.enterText(
            find.byKey(const Key('username-field')),
            'kminchelle',
          );
          await tester.enterText(
            find.byKey(const Key('password-field')),
            '0lelplR',
          );
          await tester.pumpAndSettle();
          await tester.tap(find.byKey(const Key('login-button')));
          await tester.pumpAndSettle();
          expect(find.byType(ListView), findsOneWidget);
          await tester.pumpAndSettle();
        },
      );
    },
  );
}
