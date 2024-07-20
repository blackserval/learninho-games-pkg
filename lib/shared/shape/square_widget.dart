import 'package:flutter/material.dart';

import '../../utils/responsive_widget.dart';

class SquareWidget extends StatelessWidget {
  final String? image;
  final Color? color;

  const SquareWidget({
    super.key,
    this.image,
    this.color = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveWidget.isMobile(context) ? 100 : 200,
      height: ResponsiveWidget.isMobile(context) ? 100 : 200,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: image == null
          ? null
          : Image.network(
              image!,
              fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: ResponsiveWidget.isMobile(context) ? 70 : 100,
                );
              },
            ),
    );
    // return Container(
    //   width: ResponsiveWidget.isMobile(context) ? 100 : 200,
    //   height: ResponsiveWidget.isMobile(context) ? 100 : 200,
    //   decoration: BoxDecoration(
    //     color: color,
    //     border: Border.all(),
    //     borderRadius: BorderRadius.circular(5),
    //     image: image == null
    //         ? null
    //         : DecorationImage(
    //             image: NetworkImage(image!),
    //             fit: BoxFit.cover,
    //           ),
    //   ),
    // );
  }
}
