import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart' hide Image;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logging/logging.dart';

class MarkerService {
  Future<BitmapDescriptor> build({
    required TextSpan textSpan,
    required Color bgColor,
    required Color bgOuterHighlightColor,
    required Color iconColor,
    bool isHighlighted = false,
    IconData? icon,
    double iconFontSize = 50,
    double iconSpacing = 12,
  }) async {
    final PictureRecorder recorder = PictureRecorder();
    final Canvas canvas = Canvas(recorder);

    final Size size = _drawMarker(
      canvas,
      textSpan: textSpan,
      bgColor: bgColor,
      bgOuterHighlightColor: bgOuterHighlightColor,
      isHighlighted: isHighlighted,
      icon: icon,
      iconColor: iconColor,
      iconFontSize: iconFontSize,
      iconSpacing: iconSpacing,
    );

    final Picture picture = recorder.endRecording();
    final Image image =
        await picture.toImage(size.width.ceil(), size.height.ceil());
    final ByteData? bytes = await image.toByteData(format: ImageByteFormat.png);

    final Uint8List data = Uint8List.view(bytes!.buffer);
    return BitmapDescriptor.fromBytes(data);
  }

  Size _drawMarker(
    Canvas canvas, {
    required TextSpan textSpan,
    required Color bgColor,
    required Color bgOuterHighlightColor,
    required bool isHighlighted,
    required IconData? icon,
    required Color iconColor,
    required double iconFontSize,
    required double iconSpacing,
  }) {
    TextPainter? iconPainter;
    if (icon != null) {
      final TextSpan iconSpan = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          color: iconColor,
          fontSize: iconFontSize,
          fontFamily: icon.fontFamily,
        ),
      );
      iconPainter = TextPainter(
        text: iconSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      iconPainter.layout();
    }

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    const double horizontalPadding = 16;
    const double verticalPadding = 4;
    final double iconWidth = iconPainter?.width ?? 0;
    final double iconHeight = iconPainter?.height ?? 0;
    const double triangleHeight = 20;
    final double highlightSize = isHighlighted ? 8 : 0;
    final double totalWidth = highlightSize +
        horizontalPadding +
        iconWidth +
        iconSpacing +
        textPainter.width +
        horizontalPadding +
        highlightSize;
    final double totalHeight = highlightSize +
        verticalPadding +
        max(iconHeight, textPainter.height) +
        verticalPadding +
        triangleHeight +
        highlightSize;

    _drawBg(
      canvas,
      totalWidth: totalWidth,
      totalHeight: totalHeight,
      bgColor: bgColor,
      bgOuterHighlightColor: bgOuterHighlightColor,
      triangleHeight: triangleHeight,
      isHighlighted: isHighlighted,
      highlightSize: highlightSize,
    );

    if (icon != null) {
      final double diffHeight =
          textPainter.height > iconHeight ? textPainter.height - iconHeight : 0;
      iconPainter!.paint(
          canvas,
          Offset(highlightSize + horizontalPadding,
              highlightSize + verticalPadding + diffHeight / 2));
    }

    final double diffHeight =
        iconHeight > textPainter.height ? iconHeight - textPainter.height : 0;
    textPainter.paint(
      canvas,
      Offset(highlightSize + horizontalPadding + iconWidth + iconSpacing,
          highlightSize + verticalPadding + diffHeight / 2),
    );

    return Size(totalWidth, totalHeight);
  }

  void _drawBg(
    Canvas canvas, {
    required double totalWidth,
    required double totalHeight,
    required Color bgColor,
    required Color bgOuterHighlightColor,
    required double triangleHeight,
    required bool isHighlighted,
    required double highlightSize,
  }) {
    final Paint bgPaint = Paint()
      ..color = isHighlighted ? bgOuterHighlightColor : bgColor;
    final double triangleWidth = triangleHeight * 1.5;
    const double radius = 12;

    canvas.drawRRect(
        RRect.fromLTRBR(0, 0, totalWidth, totalHeight - triangleHeight,
            Radius.circular(radius)),
        bgPaint);

    final Path path = Path();
    path.moveTo(
        totalWidth / 2 - triangleWidth / 2, totalHeight - triangleHeight);
    path.lineTo(totalWidth / 2, totalHeight);
    path.lineTo(
        totalWidth / 2 + triangleWidth / 2, totalHeight - triangleHeight);
    canvas.drawPath(path, bgPaint);

    if (isHighlighted) {
      final Paint innerBgPaint = Paint()..color = bgColor;

      canvas.drawRRect(
        RRect.fromLTRBR(
          highlightSize,
          highlightSize,
          totalWidth - highlightSize,
          totalHeight - highlightSize - triangleHeight,
          Radius.circular(radius),
        ),
        innerBgPaint,
      );

      final Path path = Path();
      path.moveTo(totalWidth / 2 - triangleWidth / 2,
          totalHeight - highlightSize - triangleHeight);
      path.lineTo(totalWidth / 2, totalHeight - highlightSize);
      path.lineTo(totalWidth / 2 + triangleWidth / 2,
          totalHeight - highlightSize - triangleHeight);
      canvas.drawPath(path, innerBgPaint);
    }
  }
}

// ignore: unused_element
final Logger _logger = Logger('MarkerService');
