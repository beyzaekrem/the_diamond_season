import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/localizations/app_localizations.dart';
import '../models/user_preferences.dart';
import '../models/character_data.dart';
import '../providers/character_data_provider.dart';

class LoveMatchResultsScreen extends ConsumerStatefulWidget {
  final UserPreferences userPreferences;

  const LoveMatchResultsScreen({
    super.key,
    required this.userPreferences,
  });

  @override
  ConsumerState<LoveMatchResultsScreen> createState() =>
      _LoveMatchResultsScreenState();
}

class _LoveMatchResultsScreenState
    extends ConsumerState<LoveMatchResultsScreen> {
  List<MapEntry<CharacterData, double>>? _matches;

  void _calculateMatches(List<CharacterData> characters) {
    try {
      final List<MapEntry<CharacterData, double>> matches = [];

      for (final character in characters) {
        try {
          // Check if character matches required criteria
          if (!widget.userPreferences.matchesRequiredCriteria(
            _characterToMap(character),
          )) {
            continue;
          }

          // Calculate match score
          final score = widget.userPreferences.calculateMatchScore(
            _characterToMap(character),
          );

          matches.add(MapEntry(character, score));
        } catch (e) {
          // Skip characters that cause errors
          continue;
        }
      }

      // Sort by score (highest first)
      matches.sort((a, b) => b.value.compareTo(a.value));

      if (mounted) {
        setState(() {
          _matches = matches;
        });
      }
    } catch (e) {
      // Set empty matches if calculation fails
      if (mounted) {
        setState(() {
          _matches = [];
        });
      }
    }
  }

  Map<String, dynamic> _characterToMap(CharacterData character) {
    try {
      return {
        'Age': character.age.toString(),
        'Gender': character.gender,
        'Social_Standing': character.socialStanding,
        'Wealth_Level': character.wealthLevel,
        'Education_Level': character.educationLevel,
        'Attractiveness': character.attractiveness.toString(),
        'Health': character.health.toString(),
        'Personality_Traits': character.personalityTraits,
        'Love_Match_Likelihood': character.loveMatchLikelihood,
        'Court_Presence': character.courtPresence,
        'Dance_Skills': character.danceSkills,
        'Marital_Status': character.maritalStatus,
        'Will_Marry': character.willMarry,
      };
    } catch (e) {
      // Return empty map if conversion fails
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    final charactersAsync = ref.watch(charactersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.yourMatches),
        elevation: 0,
      ),
      body: charactersAsync.when(
        data: (characters) {
          // Calculate matches when data is available
          if (_matches == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _calculateMatches(characters);
            });
          }
          return _buildResults();
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red[300],
              ),
              const SizedBox(height: 16),
              Text(
                (AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'))).errorLoadingMatches,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResults() {
    final localizations = AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'));
    
    if (_matches == null || _matches!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                size: 80,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 24),
              Text(
                localizations.noMatchesFound,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                localizations.noMatchesDescription,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(
              '${localizations.foundMatches} ${_matches!.length} ${_matches!.length == 1 ? localizations.match : localizations.matches}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          // Match Cards
          ..._matches!.take(10).map((entry) {
            final character = entry.key;
            final score = entry.value;

            return _buildMatchCard(character, score);
          }),
        ],
      ),
    );
  }

  Widget _buildMatchCard(CharacterData character, double score) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Could navigate to character detail screen
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Score and Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Character ${character.id}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${character.age} ${(AppLocalizations.of(context) ?? AppLocalizations(const Locale('en'))).yearsOld} • ${character.gender}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                      ],
                    ),
                  ),
                  // Match Score
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _getScoreColor(score).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getScoreColor(score),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 18,
                          color: _getScoreColor(score),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${score.toInt()}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _getScoreColor(score),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Character Details
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildDetailChip(
                    Icons.people,
                    character.socialStanding,
                  ),
                  _buildDetailChip(
                    Icons.attach_money,
                    character.wealthLevel,
                  ),
                  _buildDetailChip(
                    Icons.school,
                    character.educationLevel,
                  ),
                  if (character.courtPresence == 'Yes')
                    _buildDetailChip(
                      Icons.castle,
                      'Court Presence',
                    ),
                ],
              ),

              if (character.personalityTraits.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  'Personality: ${character.personalityTraits}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }
}
