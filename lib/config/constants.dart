import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/model/time_travel_model.dart';

enum WidgetType { circle, rectangle, square }

class AppConstants {
  static String channelName =
      "com.example.flutter_game_module.host/nativeCommunication";

  static const String dataFromNative = "dataFromNative";
  static const String goToPage = "goToPage";
}

TimeTravelModel timeTravelModel1 = TimeTravelModel(
  page: '/timeTravel1',
  assets: [
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '0',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '1',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '2',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '3',
    ),
  ]
);
TimeTravelModel timeTravelModel2 = TimeTravelModel(
  page: '/timeTravel1',
  assets: [
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '0',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '1',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '2',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '3',
    ),
    AssetsModel(
      url: "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
      value: '4',
    ),
  ]
);

final List<AssetsModel> magicWordTest2 = [
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "2",
  ),
];

final List<AssetsModel> magicWordTest1 = [
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "0",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "1",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "2",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "3",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "4",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "5",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "6",
  ),
  AssetsModel(
    url:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    value: "7",
  ),
];

final List<Map<String, String>> timeTravel2Test = [
  {
    "url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    "value": "0"
  },
  {
    "url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    "value": "1"
  },
  {
    "url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    "value": "2"
  },
  {
    "url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    "value": "3"
  },
  {
    "url":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/1224px-NASA_logo.svg.png",
    "value": "4"
  },
];

final List<Map<String, String>> timeTravel1Test = [
  {
    "url":
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    "value": "0"
  },
  {
    "url":
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    "value": "1"
  },
  {
    "url":
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    "value": "2"
  },
  {
    "url":
        "https://www.creativefabrica.com/wp-content/uploads/2023/09/05/Nature-wallpaper-Graphics-78543985-1.jpg",
    "value": "3"
  },
];
