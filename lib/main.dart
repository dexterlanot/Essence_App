import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';
import 'article_service.dart';
import 'bookmark_service.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookmarkService()),
        ChangeNotifierProvider(create: (context) => ThemeService()),
        ChangeNotifierProxyProvider<BookmarkService, ArticleService>(
          create: (context) => ArticleService(context.read<BookmarkService>()),
          update: (context, bookmarkService, previous) =>
              previous ?? ArticleService(bookmarkService),
        ),
      ],
      child: const AwarenessApp(),
    ),
  );
}

class AwarenessApp extends StatelessWidget {
  const AwarenessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Awareness App',
          theme: _buildTheme(themeService.isDarkMode),
          home: const HomePage(),
        );
      },
    );
  }

  ThemeData _buildTheme(bool isDarkMode) {
    final colorScheme = isDarkMode
        ? const ColorScheme.dark(
            surface: Color(0xFF27272A),
            primary: Color(0xFFF4F4F5),
            secondary: Color(0xFF3F3F46),
          )
        : const ColorScheme.light(
            surface: Color(0xFFFFFFFF),
            primary: Color(0xFF18181B),
            secondary: Color(0xFFF4F4F5),
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: colorScheme.primary,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

class ThemeService extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
