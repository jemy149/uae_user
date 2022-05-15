part of 'language_cubit.dart';

@immutable
abstract class LanguageState {}

class LanguageInitial extends LanguageState {}
class LanguageSetLocale extends LanguageState {}
class LanguageClearLocale extends LanguageState {}
