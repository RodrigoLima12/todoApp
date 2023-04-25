import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loading => 'Loading';

  @override
  String get sync => 'Synchronizing';

  @override
  String get emptyTasks => 'Insert a task';

  @override
  String get add => 'Add';
}
