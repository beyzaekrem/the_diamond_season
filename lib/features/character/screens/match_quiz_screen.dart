import 'package:flutter/material.dart';
import '../models/match_quiz_question.dart';
import '../models/user_preferences.dart';
import '../data/match_quiz_data.dart';
import 'love_match_results_screen.dart';

class MatchQuizScreen extends StatefulWidget {
  const MatchQuizScreen({super.key});

  @override
  State<MatchQuizScreen> createState() => _MatchQuizScreenState();
}

class _MatchQuizScreenState extends State<MatchQuizScreen> {
  int currentQuestionIndex = 0;
  Map<String, dynamic> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    final questions = matchQuizQuestions;

    if (currentQuestionIndex >= questions.length) {
      return _buildResults();
    }

    final question = questions[currentQuestionIndex];
    final progress = (currentQuestionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Match'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Question ${currentQuestionIndex + 1} of ${questions.length}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Question
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.question,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(height: 32),
                  ...question.answers.map((answer) => _buildAnswerCard(
                        answer,
                        question.id,
                      )),
                ],
              ),
            ),
          ),

          // Navigation Buttons (Only Previous button, auto-advance on selection)
          if (currentQuestionIndex > 0)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: OutlinedButton.icon(
                onPressed: _previousQuestion,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Previous Question'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard(MatchQuizAnswer answer, String questionId) {
    final isSelected = selectedAnswers[questionId] == answer.id;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedAnswers[questionId] = answer.id;
          });
          // Auto-advance to next question after a short delay
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              _nextQuestion();
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400]!,
                    width: 2,
                  ),
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  answer.text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextQuestion() {
    if (currentQuestionIndex < matchQuizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResults();
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void _showResults() {
    try {
      final preferences = _buildPreferences();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoveMatchResultsScreen(
            userPreferences: preferences,
          ),
        ),
      );
    } catch (e) {
      // Show error dialog if something goes wrong
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('An error occurred: ${e.toString()}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildResults() {
    try {
      final preferences = _buildPreferences();
      return LoveMatchResultsScreen(userPreferences: preferences);
    } catch (e) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
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
                  'An error occurred',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  e.toString(),
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
  }

  UserPreferences _buildPreferences() {
    try {
      final prefs = <String, dynamic>{};

      for (final question in matchQuizQuestions) {
        final answerId = selectedAnswers[question.id];
        if (answerId != null) {
          try {
            final answer = question.answers.firstWhere(
              (a) => a.id == answerId,
              orElse: () => question.answers.first,
            );
            prefs.addAll(answer.preferenceValue);
          } catch (e) {
            // Skip invalid answers
            continue;
          }
        }
      }

      // Default requirements
      prefs['mustBeSingle'] = true;
      prefs['mustWantToMarry'] = true;

      return UserPreferences(
        preferredMinAge: _safeCast<int>(prefs['preferredMinAge']),
        preferredMaxAge: _safeCast<int>(prefs['preferredMaxAge']),
        preferredGender: _safeCast<String>(prefs['preferredGender']),
        preferredSocialStanding:
            _safeCast<String>(prefs['preferredSocialStanding']),
        preferredWealthLevel: _safeCast<String>(prefs['preferredWealthLevel']),
        preferredEducationLevel:
            _safeCast<String>(prefs['preferredEducationLevel']),
        minAttractiveness: _safeCast<int>(prefs['minAttractiveness']),
        minHealth: _safeCast<int>(prefs['minHealth']),
        preferredPersonalityTraits:
            _safeCast<String>(prefs['preferredPersonalityTraits']),
        preferredLoveMatchLikelihood:
            _safeCast<String>(prefs['preferredLoveMatchLikelihood']),
        mustHaveCourtPresence: _safeCast<bool>(prefs['mustHaveCourtPresence']),
        preferredDanceSkills: _safeCast<String>(prefs['preferredDanceSkills']),
        mustBeSingle: _safeCast<bool>(prefs['mustBeSingle']) ?? true,
        mustWantToMarry: _safeCast<bool>(prefs['mustWantToMarry']) ?? true,
      );
    } catch (e) {
      // Return default preferences if building fails
      return UserPreferences(
        mustBeSingle: true,
        mustWantToMarry: true,
      );
    }
  }

  T? _safeCast<T>(dynamic value) {
    if (value == null) return null;
    if (value is T) return value;
    return null;
  }
}
