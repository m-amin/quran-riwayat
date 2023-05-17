import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/reader/view/reader_view.dart';

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
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverAppBar(
                        expandedHeight: 0.1.sh + AppBar().preferredSize.height,
                        backgroundColor: AppColors.ultraLightGreenColor,
                        elevation: 1,
                        floating: true,
                        snap: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20)
                                .copyWith(top: 0.1.sh, bottom: 0.02.sh),
                            child: SizedBox(
                              height: 0.08.sh,
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintText: 'بحث',
                                  hintStyle: TextThemes.hintStyle,
                                  filled: true,
                                  isDense: true,
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.greenColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColors.whiteColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: AppColors.greenColor,
                                  ),
                                ),
                                onChanged: (text) {
                                  controller.search(text);
                                },
                              ),
                            ),
                          ),
                        ),
                        title: Row(
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
                            Text(
                              controller.args['selected_book']?.arabicName ??
                                  '',
                              style: TextThemes.largeSubTitle
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                        titleSpacing: 0,
                        automaticallyImplyLeading: false,
                        leading: const BackButton(
                          color: AppColors.dullBlackColor,
                        ),
                        centerTitle: false,
                        pinned: true,
                      ),
                    ],
                body: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (controller.isFailed.value) {
                      return const Center(
                        child: Text('Unexpected error has occurred'),
                      );
                    } else {
                      if (controller.displayedSurahs.isEmpty) {
                        return Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  AppColors.lightGreenColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(0.05.sw),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.search_off),
                                  Text(
                                    'No results found.',
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
                                Get.to(() => ReaderPage(
                                      docId: controller
                                              .args['selected_book']?.id ??
                                          0,
                                      initialPage: 605 -
                                          int.parse(controller
                                                  .displayedSurahs[index]
                                                  .pages ??
                                              '604'),
                                    ));
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
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(surahs[index].pages ?? ''),
                Text(
                  'صفحة',
                  style: TextThemes.smallSubTitle,
                )
              ],
            ),
            const Spacer(),
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
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 0.1.sw,
              height: 0.1.sw,
              child: SvgPicture.asset(
                'assets/vectors/${surahs[index].place?.toLowerCase()}.svg',
                fit: BoxFit.fill,
              ),
            )
          ],
        ).marginSymmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
