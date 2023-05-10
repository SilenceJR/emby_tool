

import 'package:emby_tool/ui/home_cl.dart';
import 'package:get/get.dart';

class HomeBanding extends Bindings{
  @override
  void dependencies() {
    Get.put(()=>HomeController());
  }

}