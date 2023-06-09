import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_riwayat/app/pages/home/controller/home_controller.dart';
import 'package:quran_riwayat/routes/app_pages.dart';

import '../../../utilities/app_colors.dart';
import '../../../utilities/text_themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 0.45.sh,
              backgroundColor: AppColors.background,
              flexibleSpace: const FlexibleSpaceBar(
                background: SliverAppBarBackground(),
              ),
              automaticallyImplyLeading: false,
              leading: const BackButton(
                color: AppColors.dullBlackColor,
              ),
            ),
          ],
          body: GridView.builder(
            itemCount: controller.quranBooks.length,
            padding: EdgeInsets.all(10.w),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Get.toNamed(Paths.SUHRAS, arguments: [
                  {"selected_book": controller.quranBooks[index]},
                  {'context': context}
                ]);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.borderColor,
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Expanded(
                      child: Image.asset(
                          'assets/imgs/cover${controller.quranBooks[index].id}.png'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FittedBox(
                      child: Text(controller.quranBooks[index].arabicName,
                          style: TextThemes.mediumSubTitle),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FittedBox(
                      child: Text(
                        controller.quranBooks[index].englishName,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ]),
                ),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.w,
                mainAxisSpacing: 5.w,
                childAspectRatio: (2 / 3)),
          ),
        ),
      ),
    );
  }
}

class SliverAppBarBackground extends StatelessWidget {
  const SliverAppBarBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: 0.30.sh,
          height: 0.30.sh,
          child: SvgPicture.asset(
            'assets/vectors/quran_logo.svg',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          width: 0.5.sw,
          height: 0.035.sh,
          child: SvgPicture.asset(
            'assets/vectors/ayatbaqara.svg',
          ),
        ),
        const Spacer()
      ],
    );
  }
}
