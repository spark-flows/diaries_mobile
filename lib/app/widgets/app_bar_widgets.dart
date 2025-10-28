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
    this.style,
    this.paddingBackArrow,
  });

  void Function()? onTapBack;
  String title;
  bool isVisible;
  bool isCenter;
  List<Widget>? actions;
  TextStyle? style;
  EdgeInsetsGeometry? paddingBackArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsValue.whiteColor,
      centerTitle: isCenter ? true : false,
      automaticallyImplyLeading: false,
      leadingWidth:
          isVisible
              ? Utility.isTablet()
                  ? Dimens.eighty
                  : Dimens.fifty
              : Dimens.twenty,
      leading: Visibility(
        visible: isVisible,
        child: Padding(
          padding: paddingBackArrow ?? Dimens.edgeInsets12,
          child: InkWell(
            onTap: onTapBack,
            child: SvgPicture.asset(
              AssetConstants.back_arrow,
              height: Utility.isTablet() ? Dimens.thirty : Dimens.twentyFour,
              width: Utility.isTablet() ? Dimens.thirty : Dimens.twentyFour,
            ),
          ),
        ),
      ),
      titleSpacing: Dimens.zero,
      title: Text(
        title ?? "",
        style:
            Utility.isTablet()
                ? Styles.txtBlackColorW70024
                : Styles.txtBlackColorW70020,
      ),
      actions: actions,
    );
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => AppBarWidget._appBar.preferredSize;
}
