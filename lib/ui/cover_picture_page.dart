import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoverPicturePage extends StatelessWidget {
  final List<String> images;
  final String title;
  final TextStyle? titleStyle;
  final String subtitle;
  final TextStyle? subtitleStyle;
  final GlobalKey? repaintKey;

  const CoverPicturePage(
      {Key? key,
      required this.images,
      required this.title,
      required this.subtitle,
      this.titleStyle,
      this.subtitleStyle,
      this.repaintKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: repaintKey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: images
                      .map((e) => Transform.scale(
                            scale: 1,
                            child: Image.network(
                              e,
                              height: 360,
                              width: 640 / images.length,
                              fit: BoxFit.cover,
                            ),
                          ))
                      .toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: titleStyle ??
                              GoogleFonts.zhiMangXing(
                                  fontSize: 72, color: Colors.white, height: 1),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          subtitle,
                          style: subtitleStyle ??
                              GoogleFonts.rubikMicrobe(
                                  fontSize: 24, color: Colors.white, height: 1),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
