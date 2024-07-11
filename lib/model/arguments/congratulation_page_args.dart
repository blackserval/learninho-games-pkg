class CongratulationPageArgs {
  final String image;
  final String label;
  final String pageFrom;
  final String pageTo;
  final bool tryAgain;

  CongratulationPageArgs({
    required this.image,
    required this.label,
    required this.tryAgain,
    required this.pageFrom,
    required this.pageTo,
  });
}
