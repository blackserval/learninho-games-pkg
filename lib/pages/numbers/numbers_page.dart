import 'package:flutter/material.dart';
import 'package:flutter_game_module/config/constants.dart';
import 'package:flutter_game_module/model/assets_model.dart';
import 'package:flutter_game_module/pages/numbers/widgets/card_widget.dart';
import 'package:flutter_game_module/shared/widgets/custom_appbar.dart';
import 'package:flutter_game_module/shared/widgets/drag_target_widget.dart';
import 'package:flutter_game_module/shared/widgets/draggable_widget.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/game_controller.dart';
import '../../routes/app_pages.dart';
import '../../shared/app_images.dart';
import '../../shared/custom_snack.dart';
import '../../shared/widgets/audio_button.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key});

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  Map<String, String?> targets = {'0': null, '1': null, '2': null, '3': null};
  final resetNotifier = ValueNotifier(0);
  final snack = GetIt.I.get<CustomSnack>();
  final controller = GetIt.I.get<GameController>();

  void resetGame() {
    resetNotifier.value++;
    setState(
      () => targets = targets.map((key, value) => MapEntry(key, null)),
    );
  }

  void onTargetAccept({
    required String target,
    required DragTargetDetails<AssetsModel> details,
  }) {
    // audio ?
    setState(() => targets[target] = details.data.value.toString());
  }

  void onSubmit() {
    bool res = targets.values.contains(null);
    if (res) {
      snack.warning(text: 'Place a card to continue');
      return;
    }
    controller.checkSocre(
      targets: targets,
      pageFrom: AppPages.numbers,
    );
  }

  Widget leftWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardWidget(
              image: numbersLeft[0].url!,
            ),
            const Text("+", style: TextStyle(fontSize: 40)),
            CardWidget(
              image: numbersLeft[1].url!,
            ),
          ],
        ),
        const SizedBox(width: 22),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("=", style: TextStyle(fontSize: 40)),
            const SizedBox(width: 22),
            DragTargetWidget(
              targetValue: '0',
              onAcceptItem: (DragTargetDetails<AssetsModel> value) =>
                  onTargetAccept(
                details: value,
                target: '0',
              ),
              resetNotifier: resetNotifier,
              widgetType: WidgetType.square,
            ),
          ],
        ),
      ],
    );
  }

  Widget rightWidget() {
    return Column(
      children: numbersRight
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: DraggableWidget(
                targets: targets,
                item: e,
                widgetType: WidgetType.square,
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _body() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        leftWidget(),
        rightWidget(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.timeTravel1Background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              //Body
              Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.all(22),
                child: LayoutBuilder(
                  builder: (context, constrains) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _body(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              //Appbar
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: CustomAppbar(refreh: resetGame),
                ),
              ),
              //Sound button
              const Align(
                alignment: Alignment.bottomLeft,
                child: SafeArea(
                  child: AudioButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
