import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/model/tag.dart';
import 'package:redpoint/widgets/add_form/form_multi_select_chip.dart';

import '../model/grade.dart';
import '../model/route_type.dart';
import '../widgets/add_form/form_button.dart';
import '../widgets/add_form/form_select_chip.dart';

final months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

final tagOptions = [
  Tag("Dynamic"),
  Tag("Static"),
  Tag("Slopey"),
  Tag("Crimpy"),
  Tag("Juggy"),
  Tag("Crack"),
  Tag("Slab"),
  Tag("Comp"),
  Tag("Overhang"),
  Tag("Chimney"),
];

final typeOptions = [
  RouteType("Top Rope"),
  RouteType("Boulder"),
  RouteType("Lead"),
];

final yds = [
  Grade("5.5"),
  Grade("5.6"),
  Grade("5.7"),
  Grade("5.8"),
  Grade("5.9"),
  Grade("5.10"),
  Grade("5.11"),
  Grade("5.12"),
  Grade("5.13"),
  Grade("5.14"),
  Grade("5.15"),
];

final vScale = [
  Grade("V0"),
  Grade("V1"),
  Grade("V2"),
  Grade("V3"),
  Grade("V4"),
  Grade("V5"),
  Grade("V6"),
  Grade("V7"),
  Grade("V8"),
  Grade("V9"),
  Grade("V10"),
  Grade("V11"),
  Grade("V12"),
  Grade("V13"),
  Grade("V14"),
  Grade("V15"),
  Grade("V16"),
];

final gradeOptions = {
  typeOptions[0]: yds, // Top rope
  typeOptions[1]: vScale, // Boulder
  typeOptions[2]: yds, // Lead
};

const int maxTags = 5;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // The selected date of the route
  DateTime? date;
  // The index of the selected Status chip (want to try, in progress, completed)
  int? statusIndex;

  final selectedTags = ListQueue<Tag>();

  // Controllers for the text fields, to retrieve the text values
  final TextEditingController titleController = TextEditingController();
  final TextEditingController thoughtsController = TextEditingController();

  // Updates the status index
  _setStatusIndex(int? index) {
    setState(() {
      statusIndex = index;
    });
  }

  // Opens the date picker and updates the chosen date
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());

    setState(() {
      date = selected;
    });
  }

  // Converts the date to a string
  String _dateToString(DateTime? date) {
    if (date == null) {
      return "Choose date";
    } else {
      return "${months[date.month - 1]} ${date.day}, ${date.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Route"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 17.0),
                    )))
          ],
        ),
        body: Center(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                child: TextField(
                  controller: titleController,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter route name",
                  ),
                )),
            const Divider(),
            Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FormButton(
                        icon: Icons.location_pin,
                        label: "Choose location",
                        onPressed: () {}),
                    FormButton(
                        icon: Icons.calendar_month,
                        label: _dateToString(date),
                        onPressed: () {
                          _selectDate(context);
                        }),
                  ],
                )),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButton(
                    hint: const Text("Type"),
                    items: typeOptions.map((RouteType type) {
                      return DropdownMenuItem<String>(
                        value: type.label,
                        child: Text(type.label),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButton(
                    hint: const Text("Grade"),
                    items: vScale.map((Grade grade) {
                      return DropdownMenuItem<String>(
                        value: grade.label,
                        child: Text(grade.label),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormSelectChip(
                    label: "Want to try",
                    index: 0,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
                FormSelectChip(
                    label: "In progress",
                    index: 1,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
                FormSelectChip(
                    label: "Completed",
                    index: 2,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
              ],
            ),
            const Divider(),
            Text("Difficulty"),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                runSpacing: -10,
                alignment: WrapAlignment.center,
                spacing: 4,
                children: [
                  for (final tag in tagOptions)
                    FormMultiSelectChip<Tag>(
                      label: tag.label,
                      value: tag,
                      values: selectedTags,
                      maxLength: maxTags,
                      callback: () {
                        setState(() {});
                      },
                    )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                maxLines: 7,
                controller: thoughtsController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter any thoughts here"),
              ),
            ),
          ]),
        ));
  }
}
