import 'package:bloc/bloc.dart';
import 'package:myshop/core/shared/shared_preferences_service.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());
  loadLanguage() {
    emit(state.copyWith(language: SharedPreferencesService.getLangauge()));
  }

  storeLangauge(String language) async {
    await SharedPreferencesService.storeLangauge(language);
    emit(state.copyWith(language: SharedPreferencesService.getLangauge()));
  }
}
