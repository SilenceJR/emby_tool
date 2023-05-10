import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:emby_tool/util/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final imageUtil = _ImageUtil();

class _ImageUtil {
  /// 截屏图片生成图片流ByteData
  Future<ByteData?> capturePngToByteData(GlobalKey key,
      {double? devicePixelRatio}) async {
    try {
      RenderRepaintBoundary? boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      double dpr = ui.window.devicePixelRatio; // 获取当前设备的像素比
      ui.Image? image =
          await boundary?.toImage(pixelRatio: devicePixelRatio ?? dpr);
      return await image?.toByteData(format: ui.ImageByteFormat.png);
    } catch (e) {
      log.e(e);
    }
    return null;
  }
}
