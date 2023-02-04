import 'package:allerhand_test/app_data.dart';
import 'package:allerhand_test/models/stage_data.dart';

import '../bloc/people_bloc.dart';
import '../models/person.dart';

class AllerhandRepository {
  const AllerhandRepository();

  Future<StageInfo> getPeopleByStage(int stage) async {
    return StageInfo(
      title:
          'Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet',
      people: List.generate(
          5,
          (index) => Person(
                familyName: 'Фамилия',
                name: 'Имя',
                secondName: 'Отчество',
                position: 'должность',
                photoRef: 'assets/photo.png',
              )),
    );
  }
}
