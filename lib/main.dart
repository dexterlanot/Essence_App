import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'article_service.dart';
import 'bookmark_service.dart';
import 'login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Main function to run the app
void main() {
  runApp(
    // MultiProvider is used to provide multiple services to the widget tree
    MultiProvider(
      providers: [
        // ChangeNotifierProvider for BookmarkService allows widgets to listen to changes in bookmarked articles
        ChangeNotifierProvider(create: (context) => BookmarkService()),
        // ChangeNotifierProvider for ThemeService manages the app's theme state
        ChangeNotifierProvider(create: (context) => ThemeService()),
        // ChangeNotifierProxyProvider combines BookmarkService and ArticleService
        // This allows ArticleService to depend on BookmarkService while still being listenable
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

// Main app widget
class AwarenessApp extends StatelessWidget {
  const AwarenessApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer widget listens to changes in ThemeService
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Awareness App',
          // The theme is dynamically built based on the current mode (light/dark)
          theme: _buildTheme(themeService.isDarkMode),
          home: const LoginScreen(),
        );
      },
    );
  }

  // Builds the app theme based on dark mode status
  ThemeData _buildTheme(bool isDarkMode) {
    // Define color scheme based on the current theme mode
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
      // Sets the app's text theme using Google Fonts
      // This creates a consistent typography throughout the app
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
      // Customizes the style of elevated buttons
      // This ensures all elevated buttons in the app have a consistent look
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

// Service to manage theme settings
class ThemeService extends ChangeNotifier {
  bool _isDarkMode = false;

  // Getter for the current theme mode
  bool get isDarkMode => _isDarkMode;

  // Method to toggle between light and dark themes
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    // Notify all listeners (usually widgets) that the theme has changed
    notifyListeners();
  }
}
