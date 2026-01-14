class UserPreferences {
  final int? preferredMinAge;
  final int? preferredMaxAge;
  final String? preferredGender;
  final String? preferredSocialStanding;
  final String? preferredWealthLevel;
  final String? preferredEducationLevel;
  final int? minAttractiveness;
  final int? minHealth;
  final String? preferredPersonalityTraits;
  final String? preferredLoveMatchLikelihood;
  final bool? mustHaveCourtPresence;
  final String? preferredDanceSkills;
  final bool? mustBeSingle;
  final bool? mustWantToMarry;

  UserPreferences({
    this.preferredMinAge,
    this.preferredMaxAge,
    this.preferredGender,
    this.preferredSocialStanding,
    this.preferredWealthLevel,
    this.preferredEducationLevel,
    this.minAttractiveness,
    this.minHealth,
    this.preferredPersonalityTraits,
    this.preferredLoveMatchLikelihood,
    this.mustHaveCourtPresence,
    this.preferredDanceSkills,
    this.mustBeSingle,
    this.mustWantToMarry,
  });

  // Calculate match score based on preferences
  double calculateMatchScore(Map<String, dynamic> characterData) {
    double score = 0.0;
    int factors = 0;

    // Age preference
    if (preferredMinAge != null && preferredMaxAge != null) {
      final age = int.tryParse(characterData['Age']?.toString() ?? '0') ?? 0;
      if (age >= preferredMinAge! && age <= preferredMaxAge!) {
        score += 20;
      } else if (age >= preferredMinAge! - 2 && age <= preferredMaxAge! + 2) {
        score += 10;
      }
      factors++;
    }

    // Gender preference
    if (preferredGender != null) {
      if (characterData['Gender']?.toString().trim() == preferredGender) {
        score += 15;
      }
      factors++;
    }

    // Social standing
    if (preferredSocialStanding != null) {
      if (characterData['Social_Standing']?.toString().trim() ==
          preferredSocialStanding) {
        score += 15;
      }
      factors++;
    }

    // Wealth level
    if (preferredWealthLevel != null) {
      if (characterData['Wealth_Level']?.toString().trim() ==
          preferredWealthLevel) {
        score += 15;
      }
      factors++;
    }

    // Education level
    if (preferredEducationLevel != null) {
      if (characterData['Education_Level']?.toString().trim() ==
          preferredEducationLevel) {
        score += 10;
      }
      factors++;
    }

    // Attractiveness
    if (minAttractiveness != null) {
      final attr =
          int.tryParse(characterData['Attractiveness']?.toString() ?? '0') ?? 0;
      if (attr >= minAttractiveness!) {
        score += 10;
      }
      factors++;
    }

    // Health
    if (minHealth != null) {
      final health =
          int.tryParse(characterData['Health']?.toString() ?? '0') ?? 0;
      if (health >= minHealth!) {
        score += 10;
      }
      factors++;
    }

    // Personality traits
    if (preferredPersonalityTraits != null) {
      if (characterData['Personality_Traits']
              ?.toString()
              .trim()
              .toLowerCase()
              .contains(preferredPersonalityTraits!.toLowerCase()) ??
          false) {
        score += 10;
      }
      factors++;
    }

    // Love match likelihood
    if (preferredLoveMatchLikelihood != null) {
      if (characterData['Love_Match_Likelihood']?.toString().trim() ==
          preferredLoveMatchLikelihood) {
        score += 15;
      }
      factors++;
    }

    // Court presence
    if (mustHaveCourtPresence == true) {
      if (characterData['Court_Presence']?.toString().trim() == 'Yes') {
        score += 5;
      }
      factors++;
    }

    // Dance skills
    if (preferredDanceSkills != null) {
      if (characterData['Dance_Skills']?.toString().trim() ==
          preferredDanceSkills) {
        score += 5;
      }
      factors++;
    }

    if (factors == 0) return 50.0; // Default score if no preferences

    return (score / factors).clamp(0, 100);
  }

  // Check if character matches all required criteria
  bool matchesRequiredCriteria(Map<String, dynamic> characterData) {
    // Must be single
    if (mustBeSingle == true) {
      if (characterData['Marital_Status']?.toString().trim() != 'Single') {
        return false;
      }
    }

    // Must want to marry
    if (mustWantToMarry == true) {
      if (characterData['Will_Marry']?.toString().trim() != 'Yes') {
        return false;
      }
    }

    // Age range
    if (preferredMinAge != null && preferredMaxAge != null) {
      final age = int.tryParse(characterData['Age']?.toString() ?? '0') ?? 0;
      if (age < preferredMinAge! || age > preferredMaxAge!) {
        return false;
      }
    }

    // Gender
    if (preferredGender != null) {
      if (characterData['Gender']?.toString().trim() != preferredGender) {
        return false;
      }
    }

    // Court presence requirement
    if (mustHaveCourtPresence == true) {
      if (characterData['Court_Presence']?.toString().trim() != 'Yes') {
        return false;
      }
    }

    return true;
  }
}
