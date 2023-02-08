import 'person.dart';

class HeroesSection {
  final String title;
  final int id;
  final List<Person>? heroes;
  const HeroesSection({required this.title, required this.id, this.heroes});
}
