class IdolCategory {
  final String name, id;

  IdolCategory({
    required this.name,
    required this.id,
  });
}

List<IdolCategory> idolCategories = [
  IdolCategory(
    name: "Girl",
    id: "1",
  ),
  IdolCategory(
    name: "Boy",
    id: "0",
  ),
  IdolCategory(
    name: "Solo",
    id: "2",
  ),
  IdolCategory(
    name: "Mix",
    id: "3",
  ),
  IdolCategory(
    name: "Favorite",
    id: "4",
  ),
];
