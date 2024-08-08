class CongratulationPageArgs {
  final String pageFrom;
  final bool tryAgain;
  final int? score;
  final int? level;

  CongratulationPageArgs({
    required this.level,
    required this.tryAgain,
    required this.pageFrom,
    required this.score,
  });
}
