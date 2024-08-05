import 'package:flutter/material.dart';
import 'package:flutter_game_module/model/card_model.dart';

class MemoryCard extends StatefulWidget {
  final int index;
  final CardModel model;
  final bool canTouch;
  final AnimationController animationController;
  final Animation<double> animation;
  final Function({required int index}) onTap;

  const MemoryCard({
    super.key,
    required this.model,
    required this.canTouch,
    required this.index,
    required this.onTap,
    required this.animationController,
    required this.animation,
  });

  @override
  State<MemoryCard> createState() => _MemoryCardState();
}

class _MemoryCardState extends State<MemoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.canTouch
            ? () {
                widget.onTap(index: widget.index);
              }
            : null,
        child: AnimatedBuilder(
          animation: widget.animation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(widget.animation.value * 3.1415927),
              alignment: Alignment.center,
              child: widget.animation.value <= 0.5
                  ? Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 5,
                            color: Colors.grey[300]!,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Tap to Flip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    )
                  : Transform(
                      transform: Matrix4.identity()..rotateY(3.1415927),
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(widget.model.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
