import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/quiz_models.dart';
import '../data/quiz_data.dart';

class CharacterQuizScreen extends ConsumerStatefulWidget {
  const CharacterQuizScreen({super.key});

  @override
  ConsumerState<CharacterQuizScreen> createState() => _CharacterQuizScreenState();
}

class _CharacterQuizScreenState extends ConsumerState<CharacterQuizScreen> {
  int _currentQuestionIndex = 0;
  final Map<String, int> _characterScores = {};

  void _selectAnswer(QuizAnswer answer) {
    // Update scores for each character
    answer.characterScores.forEach((characterId, score) {
      _characterScores[characterId] =
          (_characterScores[characterId] ?? 0) + score;
    });

    // Move to next question or finish
    if (_currentQuestionIndex < characterQuizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    // Find character with highest score
    String? winningCharacterId;
    int maxScore = 0;

    _characterScores.forEach((characterId, score) {
      if (score > maxScore) {
        maxScore = score;
        winningCharacterId = characterId;
      }
    });

    final totalPossibleScore = characterQuizQuestions.length * 3;
    final percentage = (maxScore / totalPossibleScore) * 100;

    final result = QuizResult(
      characterId: winningCharacterId ?? 'daphne',
      score: maxScore,
      percentage: percentage,
    );

    // Navigate to result screen
    context.push('/quiz-result', extra: result);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = characterQuizQuestions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / characterQuizQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Quiz'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
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
                        'Question ${_currentQuestionIndex + 1} of ${characterQuizQuestions.length}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                    borderRadius: BorderRadius.circular(4),
                    minHeight: 8,
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
                      currentQuestion.question,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 40),
                    ...currentQuestion.answers.map((answer) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _AnswerCard(
                            answer: answer,
                            onTap: () => _selectAnswer(answer),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnswerCard extends StatelessWidget {
  final QuizAnswer answer;
  final VoidCallback onTap;

  const _AnswerCard({
    required this.answer,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                answer.text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
