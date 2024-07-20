class CongratulationPageArgs {
  final String pageFrom;
  final bool tryAgain;
  final int? score;

  CongratulationPageArgs({
    required this.tryAgain,
    required this.pageFrom,
    required this.score,
  });
}
