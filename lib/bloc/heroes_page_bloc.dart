import 'package:allerhand_test/models/heroes_section.dart';
import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';

class HeroesPageState {
  final List<HeroesSection>? sections;
  final int? selectedPersonId;
  final Person? selectedHeroData;

  HeroesPageState({
    this.sections,
    this.selectedPersonId,
    this.selectedHeroData,
  });

  HeroesPageState copyWith(
          {sections, selectedSectionId, selectedPersonId, selectedHeroData}) =>
      HeroesPageState(
        sections: sections ?? this.sections,
        selectedPersonId: selectedPersonId ?? this.selectedPersonId,
        selectedHeroData: selectedHeroData ?? this.selectedHeroData,
      );

  HeroesPageState get empty => HeroesPageState();
}

class HeroesPageBloc extends Bloc<HeroesPageEvent, HeroesPageState> {
  final repository = locator.get<AllerhandRepository>();

  HeroesPageBloc() : super(HeroesPageState()) {
    on<HeroesPageOpenedEvent>((event, emit) async {
      var sections = (await repository.fetchAllSections()).toList();
      for (int i = 0; i < sections.length; i++) {
        var heroes =
            await repository.fetchSectionHeroes(sections.elementAt(i).id);
        sections[i].heroes?.addAll(heroes);
      }
      emit(state.copyWith(sections: sections));
    });
    on<HeroesPageClosedEvent>(
      (event, emit) {
        //emit(state.empty);
      },
    );
    on<HeroesPagePersonSelectedEvent>(
      (event, emit) async {
        emit(state.copyWith(
            selectedHeroData:
                await repository.fetchPersonData(event.personId)));
      },
    );
    on<HeroesPagePersonDeselectedEvent>(
      (event, emit) => emit(state.copyWith(selectedHeroData: null)),
    );
  }
}

abstract class HeroesPageEvent {}

class HeroesPageOpenedEvent extends HeroesPageEvent {}

class HeroesPageClosedEvent extends HeroesPageEvent {}

class HeroesPagePersonSelectedEvent extends HeroesPageEvent {
  final int personId;

  HeroesPagePersonSelectedEvent(this.personId);
}

class HeroesPagePersonDeselectedEvent extends HeroesPageEvent {}
