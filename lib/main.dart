import 'package:flutter/material.dart';
import 'package:sprint_hosto/screens/login_screens/login_screen.dart';
import 'package:sprint_hosto/screens/sign_in_screen/sign_in_screen.dart';
import 'package:sprint_hosto/screens/forget_key_screen/confirm_mail_screen.dart';
import 'package:sprint_hosto/screens/forget_key_screen/change_key_screen.dart';
import 'package:sprint_hosto/screens/forget_key_screen/forget_key_screen.dart';
import 'package:sprint_hosto/screens/onboarding/onboarding_screens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sprint_hosto/utile/colors.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart'; 

void main() async{
  // 2. Initialiser le splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreens(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/confirm-mail': (context) => const ConfirmMailScreen(),
        '/change-key': (context) => const ChangeKeyScreen(),
        '/forget-key': (context) => const ForgetScreen(),

      },
      theme: ThemeData(
        useMaterial3: true,

        scaffoldBackgroundColor: background,

        colorScheme: const ColorScheme.light(
          primary: primary,
          secondary: secondary,
          surface: surface,
          error: error,
        ),

        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: navy,
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: navy,
          ),
        ),

        textTheme: TextTheme(
          displayLarge: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),

          headlineLarge: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),

          headlineMedium: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),

          headlineSmall: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),

          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),

          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textPrimary,
          ),

          bodyMedium: GoogleFonts.inter(
            fontSize: 14,
            color: textSecondary,
          ),

          labelLarge: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: textSecondary,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
            foregroundColor: primary,
            side: const BorderSide(
              color: primary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 0,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          hintStyle: GoogleFonts.inter(
            color: textSecondary,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: border,
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: border,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: primary,
              width: 2,
            ),
          ),
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primary,
          unselectedItemColor: Color(0xFF94A3B8),
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),

        chipTheme: ChipThemeData(
          backgroundColor: background,
          selectedColor: primary,
          labelStyle: GoogleFonts.inter(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      //home: const OnboardingScreens(),
    );
  }
}