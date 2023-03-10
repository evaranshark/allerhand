import 'package:allerhand_test/app_data.dart';
import 'package:allerhand_test/models/heroes_section.dart';
import 'package:allerhand_test/models/interview.dart';
import 'package:allerhand_test/models/stage_data.dart';

import '../bloc/people_bloc.dart';
import '../models/person.dart';

class AllerhandRepository {
  const AllerhandRepository();

  Future<StageInfo> fetchPeopleByStage(int stage) async {
    return StageInfo(
      title:
          'Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet',
      people: List.generate(
          5,
          (index) => Person(
                id: index,
                familyName: 'Фамилия',
                name: 'Имя',
                secondName: 'Отчество',
                position: 'должность',
                photoRef: 'assets/photo.png',
              )),
    );
  }

  Future<Iterable<HeroesSection>> fetchAllSections() async {
    return List.generate(
      2,
      (index) => HeroesSection(
        title: 'Название секции $index',
        id: index,
        heroes: [],
      ),
    );
  }

  Future<Iterable<Person>> fetchSectionHeroes(int sectionId) async {
    return List.generate(
      4,
      (index) => Person(
        id: index,
        familyName: 'Фамилия',
        name: 'Имя',
        secondName: 'Отчество',
        position: 'должность',
        photoRef: 'assets/photo.png',
      ),
    );
  }

  Future<Person> fetchPersonData(int personId) async {
    return Person(
      id: personId,
      familyName: 'Фамилия',
      name: 'Имя',
      secondName: 'Отчество',
      position: 'должность',
      photoRef: 'assets/photo.png',
      description: 'Lorem ipsum',
    );
  }

  Future<Interview> fetchInterview(int personId) async {
    return Interview(
      familyName: 'Фамилия',
      name: 'Имя',
      secondName: 'Отчество',
      subtitle: '''Lorem ipsum dolor sit amet
Lorem ipsum dolor sit ametLorem ipsum''',
      videoRef: 'assets/24216.mp4',
      baseContent:
          'Donec eu sagittis neque. Vestibulum porta eu nisl at varius. Sed congue fringilla lacinia. Sed ac est ac sem vulputate dapibus. Cras diam turpis, faucibus ac vehicula fermentum, volutpat ac mi.',
      hiddenContent:
          '''Donec eu sagittis neque. Vestibulum porta eu nisl at varius. Sed congue fringilla lacinia. Sed ac est ac sem vulputate dapibus. Cras diam turpis, faucibus ac vehicula fermentum, volutpat ac mi.
Donec eu sagittis neque. Vestibulum porta eu nisl at varius. Sed congue fringilla lacinia. Sed ac est ac sem vulputate dapibus. Cras diam turpis, faucibus ac vehicula fermentum, volutpat ac mi.
Donec eu sagittis neque. Vestibulum porta eu nisl at varius. Sed congue fringilla lacinia. Sed ac est ac sem vulputate dapibus. Cras diam turpis, faucibus ac vehicula fermentum, volutpat ac mi.''',
    );
  }
}
