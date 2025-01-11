import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoadingErrorContainer extends StatelessWidget {
  final String message;
  final VoidCallback onReload;

  const LoadingErrorContainer({
    super.key,
    required this.message,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextOutput(
            text: message,
            type: Type.smallTitle,
          ),
          const SizedBox(height: DimensionConstant.defaultPadding),
          ButtonStandard(
            title: AppLocalizations.of(context)!.loadingErrorContainerReload,
            widthContent: true,
            icon: CupertinoIcons.refresh,
            onTap: onReload,
          ),
        ],
      ),
    );
  }
}
