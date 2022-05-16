import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
        title: "Profile",
        body: Center(
          child: Text("Profile"),
        ));
  }
}
