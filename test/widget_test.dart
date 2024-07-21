import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:final_project/main.dart';
import 'package:final_project/login_screen.dart';
import 'package:final_project/article_service.dart';
import 'package:final_project/bookmark_service.dart';

void main() {
  testWidgets('LoginScreen is displayed and theme toggles correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BookmarkService()),
          ChangeNotifierProvider(create: (context) => ThemeService()),
          ChangeNotifierProxyProvider<BookmarkService, ArticleService>(
            create: (context) =>
                ArticleService(context.read<BookmarkService>()),
            update: (context, bookmarkService, previous) =>
                previous ?? ArticleService(bookmarkService),
          ),
        ],
        child: const AwarenessApp(),
      ),
    );

    expect(find.byType(LoginScreen), findsOneWidget);

    final ThemeData initialTheme =
        Theme.of(tester.element(find.byType(LoginScreen)));
    expect(initialTheme.colorScheme.primary, Color(0xFF18181B));

    final themeService = Provider.of<ThemeService>(
        tester.element(find.byType(LoginScreen)),
        listen: false);
    themeService.toggleTheme();
    await tester.pumpAndSettle();

    final ThemeData updatedTheme =
        Theme.of(tester.element(find.byType(LoginScreen)));
    expect(updatedTheme.colorScheme.primary, Color(0xFFF4F4F5));
  });
}
