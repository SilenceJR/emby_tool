import 'package:emby_tool/router/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'util/log.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Emby tool',
      initialRoute: RoutePath.home.path,
      getPages: appPages,
      debugShowCheckedModeBanner: false,
      enableLog: !kReleaseMode,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system ?? ThemeMode.dark,
      logWriterCallback: _localLogWriter,
    );
  }

  void _localLogWriter(String text, {bool isError = false}) {
    if (isError || Get.isLogEnable) log.log(isError?Level.error:Level.info,text);
  }
}
