import 'package:flutter/material.dart';

const String _pngPath = 'assets/pngs';

class PngImage extends AssetImage {
  const PngImage(String fileName) : super('$_pngPath/$fileName');
}

abstract class AppPngs {}
