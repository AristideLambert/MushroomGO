import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class AccountBackground extends StatelessWidget {
  const AccountBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: DimensionConstant.flexTopAccountBackground,
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          flex: DimensionConstant.flexBottomAccountBackground,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}
