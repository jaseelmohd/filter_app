import 'package:filter_app/Utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RatingWidget extends StatelessWidget {
  final double value;
  const RatingWidget({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index >= value) {
          return Icon(
            Icons.star_border,
            color: Colors.yellow,
          );
        } else if (index > value - 1 && index < value) {
          return Icon(
            Icons.star_half,
            color: Colors.yellow,
          );
        } else {
          return Icon(
            Icons.star,
            color: Colors.yellow,
          );
        }
      }),
    );
  }
}
