class CharacterData {
  final int id;
  final int age;
  final String gender;
  final String socialStanding;
  final String wealthLevel;
  final String educationLevel;
  final String familyConnections;
  final int attractiveness;
  final int health;
  final String personalityTraits;
  final int numberOfSuitors;
  final String arrangedMarriageLikelihood;
  final String loveMatchLikelihood;
  final String courtPresence;
  final String danceSkills;
  final String reputation;
  final String maritalStatus;
  final String siblingsMaritalStatus;
  final String parentsMaritalStatus;
  final String dowrySize;
  final String landOwnership;
  final String politicalInfluence;
  final String religiousDevotion;
  final String artisticTalents;
  final int eligibleAge;
  final String pregnancyStatus;
  final String scandalInvolvement;
  final String willMarry;

  CharacterData({
    required this.id,
    required this.age,
    required this.gender,
    required this.socialStanding,
    required this.wealthLevel,
    required this.educationLevel,
    required this.familyConnections,
    required this.attractiveness,
    required this.health,
    required this.personalityTraits,
    required this.numberOfSuitors,
    required this.arrangedMarriageLikelihood,
    required this.loveMatchLikelihood,
    required this.courtPresence,
    required this.danceSkills,
    required this.reputation,
    required this.maritalStatus,
    required this.siblingsMaritalStatus,
    required this.parentsMaritalStatus,
    required this.dowrySize,
    required this.landOwnership,
    required this.politicalInfluence,
    required this.religiousDevotion,
    required this.artisticTalents,
    required this.eligibleAge,
    required this.pregnancyStatus,
    required this.scandalInvolvement,
    required this.willMarry,
  });

  factory CharacterData.fromMap(Map<String, dynamic> map) {
    int safeParseInt(String? value, int defaultValue) {
      if (value == null || value.isEmpty) return defaultValue;
      return int.tryParse(value.toString().trim()) ?? defaultValue;
    }

    return CharacterData(
      id: safeParseInt(map['ID']?.toString(), 0),
      age: safeParseInt(map['Age']?.toString(), 0),
      gender: (map['Gender'] ?? '').toString().trim(),
      socialStanding: (map['Social_Standing'] ?? '').toString().trim(),
      wealthLevel: (map['Wealth_Level'] ?? '').toString().trim(),
      educationLevel: (map['Education_Level'] ?? '').toString().trim(),
      familyConnections: (map['Family_Connections'] ?? '').toString().trim(),
      attractiveness: safeParseInt(map['Attractiveness']?.toString(), 0),
      health: safeParseInt(map['Health']?.toString(), 0),
      personalityTraits: (map['Personality_Traits'] ?? '').toString().trim(),
      numberOfSuitors: safeParseInt(map['Number_of_Suitors']?.toString(), 0),
      arrangedMarriageLikelihood:
          (map['Arranged_Marriage_Likelihood'] ?? '').toString().trim(),
      loveMatchLikelihood:
          (map['Love_Match_Likelihood'] ?? '').toString().trim(),
      courtPresence: (map['Court_Presence'] ?? '').toString().trim(),
      danceSkills: (map['Dance_Skills'] ?? '').toString().trim(),
      reputation: (map['Reputation'] ?? '').toString().trim(),
      maritalStatus: (map['Marital_Status'] ?? '').toString().trim(),
      siblingsMaritalStatus:
          (map['Siblings_Marital_Status'] ?? '').toString().trim(),
      parentsMaritalStatus:
          (map['Parents_Marital_Status'] ?? '').toString().trim(),
      dowrySize: (map['Dowry_Size'] ?? '').toString().trim(),
      landOwnership: (map['Land_Ownership'] ?? '').toString().trim(),
      politicalInfluence: (map['Political_Influence'] ?? '').toString().trim(),
      religiousDevotion: (map['Religious_Devotion'] ?? '').toString().trim(),
      artisticTalents: (map['Artistic_Talents'] ?? '').toString().trim(),
      eligibleAge: safeParseInt(map['Eligible_Age']?.toString(), 0),
      pregnancyStatus: (map['Pregnancy_Status'] ?? '').toString().trim(),
      scandalInvolvement:
          (map['Scandal_Involvement'] ?? '').toString().trim(),
      willMarry: (map['Will_Marry'] ?? '').toString().trim(),
    );
  }

  // Calculate compatibility score with another character
  double calculateCompatibility(CharacterData other) {
    double score = 0.0;
    int factors = 0;

    // Social standing compatibility (similar is better)
    if (socialStanding == other.socialStanding) {
      score += 20;
    }
    factors++;

    // Wealth level compatibility
    if (wealthLevel == other.wealthLevel) {
      score += 15;
    } else if ((wealthLevel == 'High' && other.wealthLevel == 'Very High') ||
        (wealthLevel == 'Very High' && other.wealthLevel == 'High')) {
      score += 10;
    }
    factors++;

    // Education compatibility
    if (educationLevel == other.educationLevel) {
      score += 10;
    }
    factors++;

    // Attractiveness compatibility (similar attractiveness)
    int attrDiff = (attractiveness - other.attractiveness).abs();
    score += (10 - attrDiff).clamp(0, 10).toDouble();
    factors++;

    // Health compatibility
    int healthDiff = (health - other.health).abs();
    score += (10 - healthDiff).clamp(0, 10).toDouble();
    factors++;

    // Love match likelihood
    if (loveMatchLikelihood == 'High' && other.loveMatchLikelihood == 'High') {
      score += 15;
    } else if (loveMatchLikelihood == 'Medium' &&
        other.loveMatchLikelihood == 'Medium') {
      score += 10;
    }
    factors++;

    // Court presence (both should attend)
    if (courtPresence == 'Yes' && other.courtPresence == 'Yes') {
      score += 10;
    }
    factors++;

    // Dance skills compatibility
    if (danceSkills == other.danceSkills) {
      score += 5;
    }
    factors++;

    // Age compatibility (similar age is better, but not too strict)
    int ageDiff = (age - other.age).abs();
    if (ageDiff <= 3) {
      score += 10;
    } else if (ageDiff <= 5) {
      score += 5;
    }
    factors++;

    return (score / factors).clamp(0, 100);
  }

  String get displayName => 'Character $id';
  String get displayInfo =>
      '$age years old, $gender, $socialStanding class, $wealthLevel wealth';
}
