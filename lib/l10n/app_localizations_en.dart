// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Basketball Scoreboard';

  @override
  String get team1 => 'Team 1';

  @override
  String get team2 => 'Team 2';

  @override
  String get freeThrow => 'Free Throw (+1)';

  @override
  String get twoPoints => '2 Points';

  @override
  String get threePoints => '3 Points';

  @override
  String get undoLastPlay => 'Undo Last Play';
}
