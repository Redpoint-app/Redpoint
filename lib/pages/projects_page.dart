import 'package:flutter/material.dart';
import 'package:redpoint/widgets/layout/page_scaffold.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
        title: "Projects",
        body: Center(
          child: Text("Projects"),
        ));
  }
}
