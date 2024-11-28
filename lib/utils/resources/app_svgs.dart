import 'package:flutter_svg/flutter_svg.dart';

const String _svgPath = 'assets/svgs';

class SvgImage {
  final String path;
  const SvgImage(String fileName) : path = '$_svgPath/$fileName';
}

abstract class AppSvgs {}
