class CardModel {
  final String imageUrl;
  final String value;
  bool isFlipped;
  bool isMatched;

  CardModel({
    required this.imageUrl,
    required this.value,
    required this.isFlipped,
    required this.isMatched,
  });
}
