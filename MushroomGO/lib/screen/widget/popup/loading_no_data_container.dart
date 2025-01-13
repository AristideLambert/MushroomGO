import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';

class LoadingNoDataContainer extends StatelessWidget {
  final String title;
  final Future<void> Function() onReload;

  const LoadingNoDataContainer({super.key, required this.title, required this.onReload});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final height = constraints.maxHeight;
          return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              elevation: DimensionConstant.defaultElevation,
              onRefresh: onReload,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: height,
                  child: Center(
                    child: TextOutput(
                      text: title,
                      type: Type.mediumTitle,
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}