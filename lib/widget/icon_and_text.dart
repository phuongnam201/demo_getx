import 'package:flutter/material.dart';
import 'package:learning_paginate/utils/dimension.dart';
import 'package:learning_paginate/widget/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textColor;
  final double? iconSize;
  final double? textSize;

  final Color iconColor;
  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.textColor,
    this.iconSize,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize ?? Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.height10 / 2,
        ),
        SmallText(
          text: text,
          color: textColor ?? Colors.black87,
          size: textSize ?? Dimensions.font16,
          maxLines: 1,
        ),
      ],
    );
  }
}
