import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/app_colors.dart';
import '../utilities/text_themes.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    Key? key,
    required this.child,
    this.bottomSpacing,
    this.height,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  final List<Widget> child;
  final double? bottomSpacing;
  final double? height;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
                  vertical: verticalPadding ?? 0.06.sw,
                  horizontal: horizontalPadding ?? 0.06.sw)
              .copyWith(top: 10.h),
          child: Column(
            children: [
              Container(
                width: 30.w,
                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.lightGreenColor),
              ),
              ...child,
              SizedBox(
                height: bottomSpacing ?? 0.2.sh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetTile extends StatelessWidget {
  final Icon? icon;
  final String title;
  final Function() onPressed;
  final Color textColor;
  final Widget? trailing;
  final TextStyle? textStyle;

  const BottomSheetTile({
    Key? key,
    this.icon,
    required this.title,
    required this.onPressed,
    this.textColor = AppColors.dullBlackColor,
    this.trailing,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          onTap: onPressed,
          horizontalTitleGap: 5.w,
          leading: icon,
          title: Text(
            title,
            style: textStyle ??
                TextThemes.mediumSubTitle.copyWith(color: textColor),
          ),
          trailing: trailing ?? const SizedBox(),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 0.12.sw),
          child: Divider(
            color: AppColors.dullBlackColor.withOpacity(0.25),
            thickness: 0.5,
            height: 0,
          ),
        ),
      ],
    );
  }
}
