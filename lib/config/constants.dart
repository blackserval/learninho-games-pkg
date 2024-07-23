import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/model/game_model.dart';

enum WidgetType { circle, rectangle, square }

class AppConstants {
  static String channelName =
      "com.example.flutter_game_module.host/nativeCommunication";

  static const String dataFromNative = "dataFromNative";
  static const String gameResult = "game_result";
  static const String goToPageMethod = "goToPage";
  static const String settingsMethod = "settings";
}

GameModel timeTravelModel1 = GameModel(
  page: '/timeTravel1',
  assets: [
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "0",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "1",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "2",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "3",
    ),
  ],
);

GameModel timeTravelModel2 = GameModel(
  page: '/timeTravel1',
  assets: [
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "0",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "1",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "2",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "3",
    ),
    AssetsModel(
      url:
          "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: "4",
    ),
  ],
);

final List<AssetsModel> memoryTest = [
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "2",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "3",
  ),
];

final List<AssetsModel> numbersRight = [
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "2",
  ),
];

final List<AssetsModel> numbersLeft = [
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "1",
  ),
];

final List<AssetsModel> magicWordTest2 = [
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "2",
  ),
];

final List<AssetsModel> magicWordTest1 = [
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "2",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "3",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "4",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "5",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "6",
  ),
  AssetsModel(
    url:
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    value: "7",
  ),
];
