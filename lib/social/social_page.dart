import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class SocialPage extends PageTemplate {
  SocialPage()
      : super(
          title: "Social",
          icon: Icons.show_chart,
          body: const Center(child: Text("Social")),
        );
}
