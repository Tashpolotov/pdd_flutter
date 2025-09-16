import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final bool showBackButton;

  const AppbarCustom({
    super.key,
    required this.titleAppBar,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black;
    final appBarColor = isDarkMode ? Colors.black : Colors.white;

    return AppBar(
      backgroundColor: appBarColor,
      centerTitle: true,
      title: Text(titleAppBar),
      iconTheme: IconThemeData(color: iconColor),
      leading: showBackButton
          ? IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: SvgPicture.asset(
          Assets.images.arrowLeft.path,
          color: iconColor,
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
