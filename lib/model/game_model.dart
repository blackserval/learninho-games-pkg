import 'assets_model.dart';

class GameModel {
  String? page;
  List<AssetsModel>? assets;
  int level;

  GameModel({
    this.page,
    this.assets,
    this.level = 0,
  });
}
