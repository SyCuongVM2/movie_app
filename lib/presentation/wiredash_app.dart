import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import 'themes/theme_color.dart';

class WiredashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  final String languageCode;

  WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movieapp-wz95hz8',
      secret: 'wxcOmzOZS6aXmy_YKgZS9N7dKQ3auS3n',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan,
      ),
    );
  }
}