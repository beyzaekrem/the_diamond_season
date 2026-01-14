class QuizQuestion {
  final String id;
  final String question;
  final List<QuizAnswer> answers;

  QuizQuestion({
    required this.id,
    required this.question,
    required this.answers,
  });
}

class QuizAnswer {
  final String id;
  final String text;
  final Map<String, int> characterScores; // characterId -> score

  QuizAnswer({
    required this.id,
    required this.text,
    required this.characterScores,
  });
}

class Character {
  final String id;
  final String name;
  final String description;
  final String quote;
  final String imagePath; // Future use

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.quote,
    this.imagePath = '',
  });
}

class QuizResult {
  final String characterId;
  final int score;
  final double percentage;

  QuizResult({
    required this.characterId,
    required this.score,
    required this.percentage,
  });
}
