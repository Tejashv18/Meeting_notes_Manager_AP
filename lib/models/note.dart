
class Note {
  String title;
  String content;
  DateTime date;
  bool isFavorite;

  Note({
    required this.title,
    required this.content,
    required this.date,
    this.isFavorite = false,
  });
}