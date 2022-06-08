import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({super.key});

  @override
  State<SocialPage> createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
        title: "Social",
        body: Center(
          child: Text("Social"),
        ));
  }
}
