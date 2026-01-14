import '../models/quiz_models.dart';

// Bridgerton Characters
final List<Character> bridgertonCharacters = [
  Character(
    id: 'daphne',
    name: 'Daphne Bridgerton',
    description:
        'You are the Diamond of the First Water! Elegant, graceful, and deeply romantic. You value true love above all and believe in the power of genuine connection.',
    quote: 'I do not wish to marry a man I cannot love.',
  ),
  Character(
    id: 'simon',
    name: 'Simon Basset, Duke of Hastings',
    description:
        'You are brooding, intelligent, and fiercely independent. Behind your composed exterior lies deep passion and a protective nature toward those you care for.',
    quote: 'I burn for you.',
  ),
  Character(
    id: 'anthony',
    name: 'Anthony Bridgerton',
    description:
        'You are a natural leader, fiercely protective, and burdened by responsibility. You put family first but struggle with vulnerability and opening your heart.',
    quote: 'You are the bane of my existence and the object of all my desires.',
  ),
  Character(
    id: 'kate',
    name: 'Kate Sharma',
    description:
        'Strong-willed, independent, and sharp-witted. You challenge norms and are unafraid to speak your mind. Family means everything to you, and you fight fiercely for those you love.',
    quote: 'I am nobody\'s diamond. I am my own.',
  ),
  Character(
    id: 'penelope',
    name: 'Penelope Featherington',
    description:
        'Intelligent, observant, and underestimated. You see things others miss and have a creative spirit. You value wit and authenticity, often hidden behind a quiet exterior.',
    quote: 'Sometimes the most powerful person in the room is the one people overlook.',
  ),
  Character(
    id: 'colin',
    name: 'Colin Bridgerton',
    description:
        'Charming, adventurous, and searching for your purpose. You have a kind heart, love travel, and are always seeking new experiences and connections.',
    quote: 'I will never, ever court Penelope Featherington.',
  ),
  Character(
    id: 'eloise',
    name: 'Eloise Bridgerton',
    description:
        'Intellectual, independent, and ahead of your time. You challenge societal expectations, value education, and refuse to be confined by tradition.',
    quote: 'I do not wish to be a debutante. I wish to be an intellectual.',
  ),
  Character(
    id: 'benedict',
    name: 'Benedict Bridgerton',
    description:
        'Artistic, free-spirited, and introspective. You see beauty in everything and seek deeper meaning in life. You value authenticity over society\'s expectations.',
    quote: 'I want to be more than just a gentleman.',
  ),
];

// Quiz Questions
final List<QuizQuestion> characterQuizQuestions = [
  QuizQuestion(
    id: 'q1',
    question: 'What is your ideal evening?',
    answers: [
      QuizAnswer(
        id: 'a1',
        text: 'An elegant ball with dancing and conversation',
        characterScores: {'daphne': 3, 'simon': 1, 'colin': 2},
      ),
      QuizAnswer(
        id: 'a2',
        text: 'A quiet evening reading in the library',
        characterScores: {'penelope': 3, 'eloise': 3, 'benedict': 2},
      ),
      QuizAnswer(
        id: 'a3',
        text: 'Planning and managing family affairs',
        characterScores: {'anthony': 3, 'kate': 2},
      ),
      QuizAnswer(
        id: 'a4',
        text: 'Traveling to new places and exploring',
        characterScores: {'colin': 3, 'benedict': 2, 'kate': 1},
      ),
    ],
  ),
  QuizQuestion(
    id: 'q2',
    question: 'What matters most to you?',
    answers: [
      QuizAnswer(
        id: 'a1',
        text: 'True love and deep connection',
        characterScores: {'daphne': 3, 'simon': 2, 'colin': 2},
      ),
      QuizAnswer(
        id: 'a2',
        text: 'Family honor and protection',
        characterScores: {'anthony': 3, 'kate': 3, 'daphne': 2},
      ),
      QuizAnswer(
        id: 'a3',
        text: 'Intellectual freedom and independence',
        characterScores: {'eloise': 3, 'penelope': 2, 'benedict': 2},
      ),
      QuizAnswer(
        id: 'a4',
        text: 'Authentic self-expression',
        characterScores: {'benedict': 3, 'kate': 2, 'penelope': 1},
      ),
    ],
  ),
  QuizQuestion(
    id: 'q3',
    question: 'How do you handle challenges?',
    answers: [
      QuizAnswer(
        id: 'a1',
        text: 'Face them head-on with determination',
        characterScores: {'kate': 3, 'anthony': 3, 'daphne': 2},
      ),
      QuizAnswer(
        id: 'a2',
        text: 'Observe and strategize carefully',
        characterScores: {'penelope': 3, 'simon': 2, 'eloise': 2},
      ),
      QuizAnswer(
        id: 'a3',
        text: 'Seek creative solutions',
        characterScores: {'benedict': 3, 'penelope': 2},
      ),
      QuizAnswer(
        id: 'a4',
        text: 'Rely on wit and humor',
        characterScores: {'colin': 3, 'eloise': 2},
      ),
    ],
  ),
  QuizQuestion(
    id: 'q4',
    question: 'What is your greatest strength?',
    answers: [
      QuizAnswer(
        id: 'a1',
        text: 'Compassion and understanding',
        characterScores: {'daphne': 3, 'colin': 2},
      ),
      QuizAnswer(
        id: 'a2',
        text: 'Intelligence and observation',
        characterScores: {'penelope': 3, 'eloise': 3, 'simon': 2},
      ),
      QuizAnswer(
        id: 'a3',
        text: 'Leadership and responsibility',
        characterScores: {'anthony': 3, 'kate': 2},
      ),
      QuizAnswer(
        id: 'a4',
        text: 'Creativity and vision',
        characterScores: {'benedict': 3, 'penelope': 1},
      ),
    ],
  ),
  QuizQuestion(
    id: 'q5',
    question: 'What draws you to someone?',
    answers: [
      QuizAnswer(
        id: 'a1',
        text: 'Their intelligence and conversation',
        characterScores: {'eloise': 3, 'penelope': 2, 'benedict': 2},
      ),
      QuizAnswer(
        id: 'a2',
        text: 'Genuine connection and chemistry',
        characterScores: {'daphne': 3, 'simon': 3, 'colin': 2},
      ),
      QuizAnswer(
        id: 'a3',
        text: 'Strength and matching your intensity',
        characterScores: {'kate': 3, 'anthony': 3},
      ),
      QuizAnswer(
        id: 'a4',
        text: 'Kindness and a good heart',
        characterScores: {'daphne': 2, 'colin': 3, 'penelope': 2},
      ),
    ],
  ),
];
