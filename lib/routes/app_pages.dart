import 'package:get/get.dart';

import '../app/pages/home/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomePage(),
    )
  ];
}
