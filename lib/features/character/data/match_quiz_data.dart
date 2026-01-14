import '../models/match_quiz_question.dart';

final List<MatchQuizQuestion> matchQuizQuestions = [
  MatchQuizQuestion(
    id: 'q1',
    question: 'At a grand ball in Mayfair, what age would your ideal dance partner be?',
    type: 'range',
    preferenceKey: 'age',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'A fresh debutante, 18-25 years',
        preferenceValue: {'preferredMinAge': 18, 'preferredMaxAge': 25},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'In their prime, 26-30 years',
        preferenceValue: {'preferredMinAge': 26, 'preferredMaxAge': 30},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'A distinguished gentleman or lady, 31-35 years',
        preferenceValue: {'preferredMinAge': 31, 'preferredMaxAge': 35},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Age is but a number, my dear',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q2',
    question: 'Which would you prefer for your match?',
    type: 'single',
    preferenceKey: 'gender',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'A gentleman of fine breeding',
        preferenceValue: {'preferredGender': 'Male'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'A lady of grace and elegance',
        preferenceValue: {'preferredGender': 'Female'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'I am open to either, as long as they are suitable',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q3',
    question: 'What social standing would make your family most pleased?',
    type: 'single',
    preferenceKey: 'socialStanding',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'Upper class - only the finest will do',
        preferenceValue: {'preferredSocialStanding': 'Upper'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Middle class - respectable and proper',
        preferenceValue: {'preferredSocialStanding': 'Middle'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Lower class - love knows no boundaries',
        preferenceValue: {'preferredSocialStanding': 'Lower'},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Social standing matters not to me',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q4',
    question: 'What level of fortune would you find most appealing?',
    type: 'single',
    preferenceKey: 'wealth',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'A vast fortune - estates and titles',
        preferenceValue: {'preferredWealthLevel': 'Very High'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'A comfortable inheritance',
        preferenceValue: {'preferredWealthLevel': 'High'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Modest means, but respectable',
        preferenceValue: {'preferredWealthLevel': 'Medium'},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Humble circumstances',
        preferenceValue: {'preferredWealthLevel': 'Low'},
      ),
      MatchQuizAnswer(
        id: 'a5',
        text: 'Wealth is not my concern',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q5',
    question: 'What level of education would impress you most?',
    type: 'single',
    preferenceKey: 'education',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'University educated - a scholar of distinction',
        preferenceValue: {'preferredEducationLevel': 'College'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Well-schooled in the basics',
        preferenceValue: {'preferredEducationLevel': 'High School'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Education is less important than character',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q6',
    question: 'Which personality would capture your heart at a soirée?',
    type: 'single',
    preferenceKey: 'personality',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'Charming and delightful - the life of every gathering',
        preferenceValue: {'preferredPersonalityTraits': 'Charming'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Charismatic and magnetic - impossible to ignore',
        preferenceValue: {'preferredPersonalityTraits': 'Charismatic'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Outgoing and vivacious - full of spirit',
        preferenceValue: {'preferredPersonalityTraits': 'Outgoing'},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Reserved and thoughtful - mysterious and intriguing',
        preferenceValue: {'preferredPersonalityTraits': 'Reserved'},
      ),
      MatchQuizAnswer(
        id: 'a5',
        text: 'Personality matters more than any trait',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q7',
    question: 'How important is finding true love versus an advantageous match?',
    type: 'single',
    preferenceKey: 'loveMatch',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'True love above all - I seek a love match',
        preferenceValue: {'preferredLoveMatchLikelihood': 'High'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'A balance of both would be ideal',
        preferenceValue: {'preferredLoveMatchLikelihood': 'Medium'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Practical considerations come first',
        preferenceValue: {'preferredLoveMatchLikelihood': 'Low'},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'I am open to whatever fate brings',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q8',
    question: 'Must your match be seen at the finest court events?',
    type: 'single',
    preferenceKey: 'courtPresence',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'Absolutely - court presence is essential',
        preferenceValue: {'mustHaveCourtPresence': true},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Not necessary - I prefer more intimate gatherings',
        preferenceValue: {'mustHaveCourtPresence': false},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'It matters not to me',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q9',
    question: 'How important are their skills on the dance floor?',
    type: 'single',
    preferenceKey: 'danceSkills',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'Excellent - they must be the talk of every ball',
        preferenceValue: {'preferredDanceSkills': 'Excellent'},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Good - competent and graceful',
        preferenceValue: {'preferredDanceSkills': 'Good'},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Average - acceptable for society',
        preferenceValue: {'preferredDanceSkills': 'Average'},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Dancing skills are of little consequence',
        preferenceValue: {},
      ),
    ],
  ),
  MatchQuizQuestion(
    id: 'q10',
    question: 'What level of beauty would make your heart flutter?',
    type: 'single',
    preferenceKey: 'attractiveness',
    answers: [
      MatchQuizAnswer(
        id: 'a1',
        text: 'Exquisite beauty - a diamond of the first water',
        preferenceValue: {'minAttractiveness': 8},
      ),
      MatchQuizAnswer(
        id: 'a2',
        text: 'Handsome or lovely - quite pleasing to the eye',
        preferenceValue: {'minAttractiveness': 6},
      ),
      MatchQuizAnswer(
        id: 'a3',
        text: 'Modest appearance - beauty lies within',
        preferenceValue: {'minAttractiveness': 4},
      ),
      MatchQuizAnswer(
        id: 'a4',
        text: 'Outward beauty matters not - character is everything',
        preferenceValue: {},
      ),
    ],
  ),
];
