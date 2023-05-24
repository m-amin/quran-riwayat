import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/text_themes.dart';
import '../controller/surah_list_controller.dart';
import '../model/surah_model.dart';

class SurahsPage extends StatelessWidget {
  const SurahsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SurahsController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/vectors/flower_1.svg',
                width: 0.33.sw,
                height: 0.45.sh,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              child: SvgPicture.asset(
                'assets/vectors/flower_2.svg',
                width: 0.25.sw,
                height: 0.35.sh,
              ),
            ),
            NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: !innerBoxIsScrolled ? 1.5 * 50.w : 50.h,
                  backgroundColor: AppColors.ultraLightGreenColor,
                  elevation: 1,
                  floating: true,
                  snap: true,
                  title: !innerBoxIsScrolled
                      ? Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  'assets/imgs/cover${controller.args['selected_book']?.id}.png'),
                              width: 25.w,
                              height: 50.w,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            FittedBox(
                              child: Text(
                                controller.args['selected_book']?.arabicName ??
                                    '',
                                style: TextThemes.largeSubTitle
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  titleSpacing: 0,
                  automaticallyImplyLeading: false,
                  leading: !innerBoxIsScrolled
                      ? const BackButton(
                          color: AppColors.dullBlackColor,
                        )
                      : const SizedBox(),
                  centerTitle: false,
                  pinned: false,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(30.h),
                    child: Container(
                      padding: innerBoxIsScrolled
                          ? EdgeInsetsDirectional.fromSTEB(0, 0, 10.w, 15.h)
                          : EdgeInsets.symmetric(horizontal: 10.w)
                              .copyWith(top: 5, bottom: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          innerBoxIsScrolled
                              ? const BackButton(
                                  color: AppColors.dullBlackColor,
                                )
                              : const SizedBox(),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search'.tr,
                              hintStyle: TextThemes.hintStyle,
                              filled: true,
                              isDense: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.greenColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.whiteColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppColors.greenColor,
                              ),
                            ),
                            onChanged: (text) {
                              controller.search(text);
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            }, body: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.isFailed.value) {
                  return Center(
                    child: Text('Unexpected error has occurred'.tr),
                  );
                } else {
                  if (controller.displayedSurahs.isEmpty) {
                    return Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.lightGreenColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(0.05.sw),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.search_off),
                              Text(
                                'No results found.'.tr,
                                style: TextThemes.mediumSubTitle,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.displayedSurahs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.surahWidgetClicked(index);
                          },
                          child: SurahWidget(
                            surahs: controller.displayedSurahs,
                            index: index,
                          ),
                        );
                      },
                    );
                  }
                }
              }
            })),
          ],
        ),
      ),
    );
  }
}

class SurahWidget extends StatelessWidget {
  const SurahWidget({
    super.key,
    required this.surahs,
    required this.index,
  });

  final List<Surah> surahs;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderColor),
            color: AppColors.background.withOpacity(0.75)),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 0.1.sw,
              height: 0.1.sw,
              child: SvgPicture.asset(
                'assets/vectors/${surahs[index].place?.toLowerCase()}.svg',
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  surahs[index].titleAr ?? '',
                  style: TextThemes.mediumSubTitle,
                ),
                Text(
                  surahs[index].title ?? '',
                  style: TextThemes.mediumSubTitle,
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(surahs[index].pages ?? ''),
                Text(
                  'Page'.tr,
                  style: TextThemes.smallSubTitle,
                )
              ],
            ),
          ],
        ).marginSymmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
