import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';

class MapPeopleState {
  final String? title;
  final List<Person>? people;

  MapPeopleState({this.title, this.people});
  MapPeopleState copyWith({title, people}) => MapPeopleState(
        title: title ?? this.title,
        people: people ?? this.people,
      );
}

class MapPeopleCubit extends Cubit<MapPeopleState> {
  MapPeopleCubit() : super(MapPeopleState());
  final repository = locator.get<AllerhandRepository>();

  void selectStage(int stage) async {
    var data = await repository.fetchPeopleByStage(stage);
    emit(state.copyWith(title: data.title, people: data.people));
  }
}
