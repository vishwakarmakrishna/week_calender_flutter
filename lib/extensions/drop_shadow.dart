import 'package:flutter/material.dart';
import 'package:interview_app/resources/color_manager.dart';

extension DropShadow on Widget {
  Widget get applyDropShadow => DecoratedBox(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorManager.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(3, 3), // changes position of shadow
              ),
            ]),
        child: this,
      );
}
