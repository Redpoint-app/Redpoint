import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';

class ProfilePage extends PageTemplate {
  ProfilePage()
      : super(
          title: "Profile",
          icon: Icons.person,
          body: const Center(child: Text("Profile")),
        );
}
