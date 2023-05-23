import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/utilities/app_colors.dart';
import 'package:quran_riwayat/app/utilities/text_themes.dart';
import 'package:quran_riwayat/routes/app_pages.dart';

import '../controller/launch_controller.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LaunchController(context));
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.ultraLightGreenColor, AppColors.background]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    onPressed: () => controller.menuButtonClicked(),
                    icon: const Icon(
                      Icons.menu,
                      color: AppColors.dullBlackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                SizedBox(
                  height: 0.25.sw,
                  width: 0.25.sw,
                  child: SvgPicture.asset('assets/vectors/rehal.svg',
                      fit: BoxFit.fill),
                ),
                Text(
                  'رِوَايَات الْقُرْآنَ الْكَرِيمِ',
                  style: TextThemes.largeSubTitle
                      .copyWith(color: AppColors.darkGreenColor),
                ),
                Text(
                  'Quran Riwayat',
                  style: TextThemes.largeSubTitle
                      .copyWith(color: AppColors.darkGreenColor),
                ),
                LaunchPageButton(
                  onPressed: () {
                    Get.toNamed(Paths.HOME);
                  },
                  child: Row(children: [
                    SizedBox(
                      width: 48.w,
                      height: 48.w,
                      child: SvgPicture.asset(
                        'assets/vectors/books.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Browse Books'.tr,
                      style: TextThemes.mediumSubTitle
                          .copyWith(color: AppColors.whiteColor),
                    )
                  ]).marginAll(8),
                ),

                /// only show continue reading button when a book has been opened
                if (controller.hasRead)
                  LaunchPageButton(
                    onPressed: () {
                      controller.continueReadingClicked();
                    },
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 48.w,
                            height: 48.w,
                            child: SvgPicture.asset(
                              'assets/vectors/reading.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 10.w),

                          /// Would require proper knowledge of Surah Pages
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       'Surah'.tr,
                          //       style: TextThemes.mediumSubTitle
                          //           .copyWith(color: AppColors.whiteColor),
                          //     ),
                          //     Text(
                          //       'Page'.tr,
                          //       style: TextThemes.smallSubTitle
                          //           .copyWith(color: Colors.grey[300]),
                          //     ),
                          //   ],
                          // ),
                          // const Spacer(),
                          Text(
                            'Continue Reading'.tr,
                            style: TextThemes.mediumSubTitle
                                .copyWith(color: AppColors.whiteColor),
                          )
                          // .marginSymmetric(horizontal: 10)
                        ]).marginAll(8),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LaunchPageButton extends StatelessWidget {
  const LaunchPageButton({
    super.key,
    required this.child,
    required this.onPressed,
  });
  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: AppColors.dullBlackColor.withOpacity(0.25),
                  offset: const Offset(0, 8),
                  blurRadius: 15)
            ]),
        child: child,
      ).marginSymmetric(horizontal: 0.05.sw, vertical: 0.025.sh),
    );
  }
}
