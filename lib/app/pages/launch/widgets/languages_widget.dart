import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utilities/app_colors.dart';
import '../controller/launch_controller.dart';

List<Widget> languagesList(BuildContext ctx) {
  var _controller = Get.find<LaunchController>();
  return LaunchController.languages.keys.map((e) {
    return Theme(
      data: Theme.of(ctx).copyWith(
        unselectedWidgetColor: AppColors.dullBlackColor.withOpacity(0.15),
      ),
      child: RadioListTile<String>(
        value: e,
        groupValue: _controller.selected.value,
        title: Text(e),
        activeColor: AppColors.lightGreenColor,
        onChanged: (value) {
          _controller.selected.value = value ?? "English";
          String languageKey = _controller.selected.value;
          String langCode = LaunchController.languages[languageKey] ?? 'en';
          _controller.changeLang(langCode);
        },
      ),
    );
  }).toList();
}
