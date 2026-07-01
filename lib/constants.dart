import 'package:flutter/material.dart';

/// Theme configuration for Light and Dark modes
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2563EB), // Refined indigo-blue
        onPrimary: Colors.white,
        secondary: Color(0xFF60A5FA), // Lighter blue accent
        onSecondary: Colors.black,
        surface: Color(0xFFF8FAFC), // Off-white section bg
        onSurface: Color(0xFF0F172A), // Near-black slate
        surfaceContainerHighest: Color(0xFFFFFFFF), // Card background
        outline: Color(0xFFE2E8F0), // Hairline borders
        onSurfaceVariant: Color(0xFF64748B), // Muted slate
        tertiary: Color(0xFFEFF6FF), // Pale blue tint (accentLight)
        tertiaryContainer: Color(0xFF10B981), // success
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3B82F6), // Slightly brighter for dark mode
        onPrimary: Colors.white,
        secondary: Color(0xFF60A5FA),
        onSecondary: Colors.black,
        surface: Color(0xFF1E293B), // Dark surface
        onSurface: Color(0xFFF8FAFC), // White text
        surfaceContainerHighest: Color(0xFF0F172A), // Darker card background
        outline: Color(0xFF334155), // Dark border
        onSurfaceVariant: Color(0xFF94A3B8), // Muted light text
        tertiary: Color(0xFF1E3A8A), // Dark blue tint (accentDark)
        tertiaryContainer: Color(0xFF10B981), // success
      ),
      scaffoldBackgroundColor: const Color(0xFF0F172A), // Very dark background
      useMaterial3: true,
    );
  }
}

class AppConstants {
  static const double padding = 24.0;
  static const double borderRadius = 12.0;
  static const double maxContentWidth = 1100.0;
}
