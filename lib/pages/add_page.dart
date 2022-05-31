import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/model/difficulty.dart';
import 'package:redpoint/model/status.dart';
import 'package:redpoint/model/tag.dart';
import 'package:redpoint/model/v_scale.dart';
import 'package:redpoint/widgets/add_form/form_multi_select_chip.dart';

import '../model/completed_status.dart';
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

const int maxTags = 5;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // The selected date of the route
  DateTime? date;
  // The selected progress value of the route
  Status? progress;
  CompletedStatus? completedStatus;

  double difficultyIndex = 0;

  final selectedTags = ListQueue<Tag>();

  // Controllers for the text fields, to retrieve the text values
  final TextEditingController titleController = TextEditingController();
  final TextEditingController thoughtsController = TextEditingController();

  // Updates the status index
  void _setStatusIndex(Status? selectedProgress) {
    setState(() {
      progress = selectedProgress;
    });
  }

  void _setCompletedStatusIndex(CompletedStatus? selectedCompletedStatus) {
    setState(() {
      completedStatus = selectedCompletedStatus;
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

  _setDifficulty(double value) {
    setState(() {
      difficultyIndex = value;
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
        body: SingleChildScrollView(
            child: Center(
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
                    items: RouteType.values.map((RouteType type) {
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
                    items: VScale.values.map((VScale grade) {
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child:
            Column(
              children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: 34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Status.values
                        .map(
                          (Status value) => FormSelectChip<Status>(
                              label: value.label,
                              value: value,
                              selectedValue: progress,
                              callback: _setStatusIndex),
                        )
                        .toList(),
                  ),
                )),
                if (progress == Status.completed)
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SizedBox(
                  height: 34,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: CompletedStatus.values
                        .map(
                          (CompletedStatus value) =>
                              FormSelectChip<CompletedStatus>(
                                  label: value.label,
                                  value: value,
                                  selectedValue: completedStatus,
                                  callback: _setCompletedStatusIndex),
                        )
                        .toList(),
                  ),
                )),
              ]),
            ),
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Difficulty"),
                ),
                Slider(
                    value: difficultyIndex,
                    min: 0,
                    max: 4,
                    divisions: 4,
                    label: Difficulty.values[difficultyIndex.round()].label,
                    onChanged: (double value) {
                      _setDifficulty(value);
                    }),
              ],
            ),
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
        )));
  }
}
