import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 0.45.sh,
              backgroundColor: Colors.transparent,
              flexibleSpace: const FlexibleSpaceBar(
                background: SliverAppBarBackground(),
              ),
            ),
          ],
          body: GridView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                    )),
                width: 50,
                height: 50,
              ),
            ),
            itemCount: 50,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
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
          width: 0.35.sh,
          height: 0.35.sh,
          child: SvgPicture.asset(
            'assets/quran_logo.svg',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          child: SvgPicture.asset(
            'assets/ayatbaqara.svg',
          ),
        ),
        const Spacer()
      ],
    );
  }
}
