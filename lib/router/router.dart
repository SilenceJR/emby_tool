import 'package:emby_tool/ui/home_bd.dart';
import 'package:emby_tool/ui/home_middleware.dart';
import 'package:emby_tool/ui/home_page.dart';
import 'package:get/get.dart';

enum RoutePath {
  home('/home');

  final String path;

  const RoutePath(this.path);
}

final appPages = [
  GetPage(
    name: RoutePath.home.path,
    page: () => const HomePage(),
    middlewares: [HomeMiddleware()],
    binding: HomeBanding(),

  ),
];
