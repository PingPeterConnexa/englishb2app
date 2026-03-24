import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary palette
  static const deepBlue = Color(0xFF1B2B5E);
  static const primaryBlue = Color(0xFF2563EB);
  static const accentBlue = Color(0xFF3B82F6);
  static const lightBlue = Color(0xFFDBEAFE);

  // Semantic
  static const success = Color(0xFF10B981);
  static const successLight = Color(0xFFD1FAE5);
  static const warning = Color(0xFFF59E0B);
  static const warningLight = Color(0xFFFEF3C7);
  static const error = Color(0xFFEF4444);
  static const errorLight = Color(0xFFFEE2E2);

  // Light theme
  static const backgroundLight = Color(0xFFF8FAFC);
  static const surfaceLight = Color(0xFFFFFFFF);
  static const cardLight = Color(0xFFFFFFFF);
  static const textPrimaryLight = Color(0xFF0F172A);
  static const textSecondaryLight = Color(0xFF64748B);
  static const textTertiaryLight = Color(0xFF94A3B8);
  static const borderLight = Color(0xFFE2E8F0);
  static const dividerLight = Color(0xFFF1F5F9);

  // Dark theme
  static const backgroundDark = Color(0xFF0F172A);
  static const surfaceDark = Color(0xFF1E293B);
  static const cardDark = Color(0xFF1E293B);
  static const textPrimaryDark = Color(0xFFF8FAFC);
  static const textSecondaryDark = Color(0xFF94A3B8);
  static const textTertiaryDark = Color(0xFF64748B);
  static const borderDark = Color(0xFF334155);
  static const dividerDark = Color(0xFF1E293B);

  // Category colors
  static const reading = Color(0xFF8B5CF6);
  static const grammar = Color(0xFF2563EB);
  static const listening = Color(0xFF06B6D4);
  static const writing = Color(0xFFF59E0B);
  /// Gap-fill practice (multiple-choice gaps).
  static const clozePart1 = Color(0xFFEC4899);

  // Gradients
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2563EB), Color(0xFF1B2B5E)],
  );

  static const accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
  );

  static const successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF34D399), Color(0xFF10B981)],
  );
}
