class Person {
  final String familyName, name, secondName, position;
  final String? description;
  final int id;
  final String photoRef;

  Person({
    required this.id,
    required this.familyName,
    required this.name,
    required this.secondName,
    required this.position,
    required this.photoRef,
    this.description,
  });
}
