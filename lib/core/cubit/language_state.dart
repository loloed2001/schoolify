part of 'language_cubit.dart';

class LanguageState {
  final String language;
  LanguageState({
    this.language = 'en',
  });

  LanguageState copyWith({
    String? language,
  }) {
    return LanguageState(
      language: language ?? this.language,
    );
  }
}
