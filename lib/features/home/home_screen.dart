import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/localizations/app_localizations.dart';
import '../../core/providers/locale_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              ref.read(localeProvider.notifier).toggleLocale();
            },
            tooltip: currentLocale.languageCode == 'en' ? 'Türkçe' : 'English',
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.goodMorning,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    localizations.yourGrace,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),

            // Featured Whisper Card
            _buildSectionTitle(context, localizations.latestWhispers),
            _buildFeaturedWhisper(context),

            const SizedBox(height: 24),

            // Quick Actions (Quizzes, Tests)
            _buildSectionTitle(context, localizations.discoverYourDestiny),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildDestinyCard(
                    context,
                    localizations.characterQuiz,
                    localizations.whichCharacterAreYou,
                    Icons.auto_stories,
                    Colors.blue.shade50,
                    onTap: () => context.push('/quiz'),
                  ),
                  _buildDestinyCard(
                    context,
                    localizations.loveMatch,
                    localizations.findYourTrueMatch,
                    Icons.favorite_border,
                    Colors.pink.shade50,
                    onTap: () => context.push('/love-match'),
                  ),
                  _buildDestinyCard(
                    context,
                    localizations.societyTest,
                    localizations.rankInTheTon,
                    Icons.stars_outlined,
                    Colors.amber.shade50,
                    onTap: () {}, // TODO: Implement Society Test
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Daily Quote
            _buildDailyQuote(context),

            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _buildFeaturedWhisper(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 150,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: const Center(
                child: Icon(Icons.menu_book, size: 48, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'LADY WHISTLEDOWN\'S COLUMN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'The Diamond of the Season: A Shocking Revelation!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Dearest reader, the competition for the Queen\'s favor has taken an unexpected turn...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text('Read More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinyCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color bgColor, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 160,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyQuote(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.format_quote,
            color: Theme.of(context).colorScheme.secondary,
            size: 40,
          ),
          const SizedBox(height: 16),
          Text(
            '"You are the bane of my existence, and the object of all my desires."',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontFamily: 'Playfair Display',
                ),

          ),
          const SizedBox(height: 16),
          const Text(
            '— Anthony Bridgerton',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
