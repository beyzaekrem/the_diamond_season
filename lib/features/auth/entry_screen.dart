import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image could go here
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF8F5F1),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/the_diamond_s.png',
                    height: 180,
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Dearest Reader,',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'The season has arrived. Join the elite and discover your destiny.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          color: Colors.black54,
                        ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => context.push('/register'),
                    child: const Text('Join the Season'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => context.push('/login'),
                    child: const Text('I already have an invitation'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.go('/home'),
                    child: Text(
                      'Continue as a Guest',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
