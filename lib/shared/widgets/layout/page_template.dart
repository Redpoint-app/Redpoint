/// A basic page template that includes the bottom navbar. Avoids code reuse.
import 'package:flutter/material.dart';

abstract class PageTemplate {
  const PageTemplate({
    required this.title,
    required this.icon,
    required this.body,
    this.scrollable,
    this.appBar,
  });
  final String title;
  final IconData icon;
  final Widget body;
  final bool? scrollable;
  final PreferredSizeWidget? appBar;
}
