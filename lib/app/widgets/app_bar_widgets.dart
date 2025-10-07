import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    required this.onTapBack,
    required this.title,
    this.isVisible = true,
    this.isCenter = false,
    this.actions,
  });

  void Function()? onTapBack;
  String title;
  bool isVisible;
  bool isCenter;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.appBg,
      centerTitle: isCenter ? true : false,
      automaticallyImplyLeading: false,
      leadingWidth: isVisible ? Dimens.fifty : Dimens.twenty,
      leading: Visibility(
        visible: isVisible,
        child: Padding(
          padding: Dimens.edgeInsets12,
          child: InkWell(
            onTap: onTapBack,
            child: SvgPicture.asset(AssetConstants.back_arrow),
          ),
        ),
      ),
      titleSpacing: Dimens.zero,
      title: Text(title, style: Styles.txtBlackColorW70020),
      actions: actions,
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => AppBarWidget._appBar.preferredSize;
}
