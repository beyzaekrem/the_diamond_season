class MatchQuizQuestion {
  final String id;
  final String question;
  final String type; // 'single', 'multiple', 'range', 'text'
  final List<MatchQuizAnswer> answers;
  final String? preferenceKey; // Which preference this affects

  MatchQuizQuestion({
    required this.id,
    required this.question,
    required this.type,
    required this.answers,
    this.preferenceKey,
  });
}

class MatchQuizAnswer {
  final String id;
  final String text;
  final Map<String, dynamic> preferenceValue; // What this answer sets

  MatchQuizAnswer({
    required this.id,
    required this.text,
    required this.preferenceValue,
  });
}
