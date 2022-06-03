import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UniversalAnimation extends StatelessWidget {
  const UniversalAnimation({
    Key? key,
    required this.url,
    this.width,
    this.height,
  }) : super(key: key);

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) {
      return _error();
    }
    return url.startsWith('assets')
        ? Lottie.asset(url, width: width, height: height)
        : Lottie.network(url, width: width, height: height);
  }

  Widget _error() {
    return Container(
      padding: EdgeInsets.all(AppInsets.i16),
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(0.2),
        shape: BoxShape.rectangle,
      ),
      height: height,
      width: height,
      child: Icon(Icons.error, size: 24),
    );
  }
}
