import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F1),
      body: Center(
        child: Image.asset(
          'assets/images/the_diamond_s.png',
          fit: BoxFit.contain,
          width: double.infinity,
        )
            .animate()
            .fadeIn(duration: 1200.ms)
            .then(delay: 800.ms)
            .fadeOut(duration: 600.ms),
      ),
    );
  }
}
