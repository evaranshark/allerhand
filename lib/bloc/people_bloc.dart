import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/person.dart';

class PeopleState {
  final String? title;
  final List<Person>? people;

  PeopleState({this.title, this.people});
  PeopleState copyWith({title, people}) => PeopleState(
        title: title ?? this.title,
        people: people ?? this.people,
      );
}

class PeopleCubit extends Cubit<PeopleState> {
  PeopleCubit() : super(PeopleState());
  final repository = locator.get<AllerhandRepository>();

  void selectStage(int stage) async {
    var data = await repository.getPeopleByStage(stage);
    emit(state.copyWith(title: data.title, people: data.people));
  }
}
