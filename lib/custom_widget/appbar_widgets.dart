
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';
import 'appbar_leading.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onLeadingTap;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? toolbarActions;
  final double? elevation;
  final double? titleSpacing;
  final bool isBackEnable;
  final bool isBackForcefullyShow;
  final bool? centerTitle;
  final Color? titleColor;
  final Icon? leadingIcon;
  final Widget? leadingWidget;
  final bool? isAutoLeadingEnable;
  final double? horizontalPadding;
  final double? additionalHeight;
  final EdgeInsets? actionsPadding;

  const AppBarWidget({
    this.onLeadingTap,
    this.title,
    this.titleWidget,
    this.toolbarActions,
    this.centerTitle,
    this.elevation,
    this.titleSpacing,
    this.isBackEnable = true,
    this.isBackForcefullyShow = false,
    this.isAutoLeadingEnable = true,
    this.titleColor,
    this.leadingIcon,
    this.leadingWidget,
    this.horizontalPadding,
    this.additionalHeight,
    this.actionsPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var isShow =
        (isBackEnable && Navigator.canPop(context)) || isBackForcefullyShow;
    return AppBar(
      forceMaterialTransparency: false,
      centerTitle: centerTitle,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 12.w),
        child:
            titleWidget ??
            AutoSizeText(
              title ?? "",
              minFontSize: 20,
              maxFontSize: 26,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: titleColor??AppColors.white,
              ),
              maxLines: 1,
            ),
      ),
      toolbarHeight: AppBar().preferredSize.height,
      leadingWidth: isShow || leadingWidget != null ? 38.w : 16.w,
      //before it was height+5w
      leading:
          leadingWidget /*??
          (isShow
              ? (isAutoLeadingEnable ?? true)
                  ? AutoLeadingButton(
                    color:
                        leadingIcon?.color ??
                        Theme.of(context).iconTheme.color,
                  )
                  : AppBarLeading(
                    onLeadingTap: onLeadingTap,
                    isForcefullyShow: isShow,
                    icon: leadingIcon,
                  )
              : const SizedBox() */,
      iconTheme: IconThemeData(
        color: AppColors.white,
        size: 20.sp,
      ),
      // titleTextStyle: TextStyle(color:const Color(0xff181818),fontSize: 22.sp,fontWeight: FontWeight.w700),
      titleSpacing: titleSpacing ?? (isShow ? 4.w : 0),
      // actionsPadding: actionsPadding ?? EdgeInsets.all(8.w),
      actionsPadding: EdgeInsets.zero,
      backgroundColor: AppColors.primary,
      actions: toolbarActions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (additionalHeight ?? 0.h));
}
