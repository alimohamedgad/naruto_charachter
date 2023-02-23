class QutoeModel {
  late String anime;
  late String character;
  late String quote;

  QutoeModel.fromJson(json) {
    anime = json['anime'];
    character = json['character'];
    quote = json['quote'];
  }
}
