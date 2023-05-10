import 'dart:io';

import 'package:emby_tool/ui/cover_picture_page.dart';
import 'package:emby_tool/ui/home_cl.dart';
import 'package:emby_tool/util/image_util.dart';
import 'package:emby_tool/util/log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    var images = [
      'https://www.themoviedb.org/t/p/w1280/bHngyBFKw5CIGBy93BVgyHMG577.jpg',
      'https://www.themoviedb.org/t/p/w1280/lD6tdmwLEJNLk5uE6bDZlaWVFfV.jpg',
      'https://www.themoviedb.org/t/p/w1280/SvkediJCh5nJssI9qLGnbjRbYQ.jpg',
      'https://www.themoviedb.org/t/p/w1280/4L4ioQBbNmjATtJfJN9XUZUm1Ka.jpg'
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          log.d('start:');
          var byteData = await imageUtil.capturePngToByteData(key,devicePixelRatio: 3);
          log.d('end:');
          log.d(byteData.toString());
          if(byteData==null) return;
          var file = File('./test.jpg');
          if(!file.existsSync()){
            await file.create();
          }
          file.writeAsBytesSync(byteData!.buffer.asUint8List());
          log.d("path: ${file.absolute.path}");
        },
        child: const Text('image'),
      ),
      body: SingleChildScrollView(
        child: CoverPicturePage(
          repaintKey: key,
          images: images,
          title: '电影',
          subtitle: 'Movie',
        ),
      ),
    );
  }
}
