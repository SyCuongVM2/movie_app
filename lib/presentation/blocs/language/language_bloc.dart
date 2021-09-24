import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/constants/languages.dart';
import '../../../domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(
    LanguageLoaded(
      Locale(Languages.languages[0].code),
    )
  );

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event
  ) async* {
    if (event is ToggleLanguageEvent) {
      yield LanguageLoaded(Locale(event.language.code));
    }
  }
}