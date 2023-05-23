import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/reader/controller/reader_controller.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/text_themes.dart';
import '../../../utilities/utilities.dart';
import '../../../widgets/widgets.dart';

class SearchForPageWidget extends StatelessWidget {
  const SearchForPageWidget(
      {Key? key, required this.onTextChange, required this.onButtonTap})
      : super(key: key);

  final Function(String value) onTextChange;
  final Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(bottomSpacing: 0, height: 0.75.sh, child: [
      Text(
        'Please Enter Page Number'.tr,
        style: TextThemes.mediumSubTitle,
      ).marginSymmetric(vertical: 20.h),
      const Spacer(),
      Row(
        children: [
          const Spacer(),
          Expanded(
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(3),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                hintText: '0 - 604',
                helperStyle: TextThemes.hintStyle,
                filled: true,
                isDense: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.greenColor),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.ultraLightGreenColor),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              onChanged: onTextChange,
            ),
          ),
          const Spacer()
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
      InkWell(
        onTap: onButtonTap,
        child: Obx(() {
          return Container(
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Get.find<ReaderController>().isButtonActive.value
                    ? AppColors.ultraLightGreenColor
                    : AppColors.disabledColor),
            child: Center(
              child: Text(
                'Go to Page'.tr,
                style: TextThemes.smallSubTitle,
              ),
            ),
          );
        }),
      ),
      const Spacer(),
    ]);
  }
}
