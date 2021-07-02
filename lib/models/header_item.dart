import 'dart:ui';

import 'package:flutter/widgets.dart';

class HeaderItem {
  final String title;
  final VoidCallback onTap;
  final bool isButton;

  HeaderItem({
    required this.title,
    required this.onTap,
    required this.isButton,
  });
}
