import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // App
      'appTitle': 'The Diamond Season',
      
      // Home Screen
      'goodMorning': 'Good Morning,',
      'yourGrace': 'Your Grace',
      'latestWhispers': 'Latest Whispers',
      'discoverYourDestiny': 'Discover Your Destiny',
      'characterQuiz': 'Character Quiz',
      'whichCharacterAreYou': 'Which character are you?',
      'loveMatch': 'Love Match',
      'findYourTrueMatch': 'Find your true match.',
      'societyTest': 'Society Test',
      'rankInTheTon': 'Rank in the ton.',
      
      // Entry Screen
      'dearestReader': 'Dearest Reader,',
      'seasonHasArrived': 'The season has arrived. Join the elite and discover your destiny.',
      'joinTheSeason': 'Join the Season',
      
      // Character Quiz
      'question': 'Question',
      'of': 'of',
      'yourMatch': 'Your Match',
      'youAre': 'You are...',
      'match': 'Match',
      'returnToHome': 'Return to Home',
      'takeQuizAgain': 'Take Quiz Again',
      
      // Love Match
      'findYourPerfectMatch': 'Find Your Perfect Match',
      'answerQuestions': 'Answer a few questions to discover characters that match your preferences',
      'startQuiz': 'Start Quiz',
      'findYourMatch': 'Find Your Match',
      'yourMatches': 'Your Matches',
      'foundMatches': 'Found',
      'matches': 'Matches',
      'noMatchesFound': 'No Matches Found',
      'noMatchesDescription': 'We couldn\'t find any characters that match your preferences. Try adjusting your criteria.',
      'errorLoadingMatches': 'Error loading matches',
      'yearsOld': 'years old',
      
      // Common
      'previousQuestion': 'Previous Question',
      'error': 'Error',
      'anErrorOccurred': 'An error occurred',
      'ok': 'OK',
      'home': 'Home',
      'pageNotFound': 'Page Not Found',
    },
    'tr': {
      // App
      'appTitle': 'Elmas Sezonu',
      
      // Home Screen
      'goodMorning': 'Günaydın,',
      'yourGrace': 'Efendimiz',
      'latestWhispers': 'Son Dedikodular',
      'discoverYourDestiny': 'Kaderinizi Keşfedin',
      'characterQuiz': 'Karakter Testi',
      'whichCharacterAreYou': 'Hangi karakter sizsiniz?',
      'loveMatch': 'Aşk Eşleşmesi',
      'findYourTrueMatch': 'Gerçek eşinizi bulun.',
      'societyTest': 'Toplum Testi',
      'rankInTheTon': 'Toplumdaki yerinizi öğrenin.',
      
      // Entry Screen
      'dearestReader': 'Sevgili Okuyucu,',
      'seasonHasArrived': 'Sezon geldi. Seçkinlere katılın ve kaderinizi keşfedin.',
      'joinTheSeason': 'Sezona Katıl',
      
      // Character Quiz
      'question': 'Soru',
      'of': '/',
      'yourMatch': 'Eşleşmeniz',
      'youAre': 'Siz...',
      'match': 'Eşleşme',
      'returnToHome': 'Ana Sayfaya Dön',
      'takeQuizAgain': 'Testi Tekrar Al',
      
      // Love Match
      'findYourPerfectMatch': 'Mükemmel Eşinizi Bulun',
      'answerQuestions': 'Tercihlerinize uygun karakterleri keşfetmek için birkaç soru cevaplayın',
      'startQuiz': 'Teste Başla',
      'findYourMatch': 'Eşinizi Bulun',
      'yourMatches': 'Eşleşmeleriniz',
      'foundMatches': 'Bulundu',
      'matches': 'Eşleşme',
      'noMatchesFound': 'Eşleşme Bulunamadı',
      'noMatchesDescription': 'Tercihlerinize uygun herhangi bir karakter bulamadık. Kriterlerinizi ayarlamayı deneyin.',
      'errorLoadingMatches': 'Eşleşmeler yüklenirken hata oluştu',
      'yearsOld': 'yaşında',
      
      // Common
      'previousQuestion': 'Önceki Soru',
      'error': 'Hata',
      'anErrorOccurred': 'Bir hata oluştu',
      'ok': 'Tamam',
      'home': 'Ana Sayfa',
      'pageNotFound': 'Sayfa Bulunamadı',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? 
           _localizedValues['en']?[key] ?? 
           key;
  }

  // Getters for convenience
  String get appTitle => translate('appTitle');
  String get goodMorning => translate('goodMorning');
  String get yourGrace => translate('yourGrace');
  String get latestWhispers => translate('latestWhispers');
  String get discoverYourDestiny => translate('discoverYourDestiny');
  String get characterQuiz => translate('characterQuiz');
  String get whichCharacterAreYou => translate('whichCharacterAreYou');
  String get loveMatch => translate('loveMatch');
  String get findYourTrueMatch => translate('findYourTrueMatch');
  String get societyTest => translate('societyTest');
  String get rankInTheTon => translate('rankInTheTon');
  String get dearestReader => translate('dearestReader');
  String get seasonHasArrived => translate('seasonHasArrived');
  String get joinTheSeason => translate('joinTheSeason');
  String get question => translate('question');
  String get ofText => translate('of');
  String get yourMatch => translate('yourMatch');
  String get youAre => translate('youAre');
  String get match => translate('match');
  String get returnToHome => translate('returnToHome');
  String get takeQuizAgain => translate('takeQuizAgain');
  String get findYourPerfectMatch => translate('findYourPerfectMatch');
  String get answerQuestions => translate('answerQuestions');
  String get startQuiz => translate('startQuiz');
  String get findYourMatch => translate('findYourMatch');
  String get yourMatches => translate('yourMatches');
  String get foundMatches => translate('foundMatches');
  String get matches => translate('matches');
  String get noMatchesFound => translate('noMatchesFound');
  String get noMatchesDescription => translate('noMatchesDescription');
  String get errorLoadingMatches => translate('errorLoadingMatches');
  String get yearsOld => translate('yearsOld');
  String get previousQuestion => translate('previousQuestion');
  String get error => translate('error');
  String get anErrorOccurred => translate('anErrorOccurred');
  String get ok => translate('ok');
  String get home => translate('home');
  String get pageNotFound => translate('pageNotFound');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
