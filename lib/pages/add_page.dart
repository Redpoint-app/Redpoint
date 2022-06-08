import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/model/difficulty.dart';
import 'package:redpoint/model/status.dart';
import 'package:redpoint/model/tag.dart';
import 'package:redpoint/widgets/add_form/form_multi_select_chip.dart';
import 'package:redpoint/model/route.dart';
import 'package:redpoint/widgets/add_form/takes_counter.dart';

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
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // The selected date of the route
  DateTime? _date;

  RouteType? _selectedType;
  String? _grade;

  // The selected progress value of the route
  Status? _status;
  CompletedStatus? _completedStatus;

  double _difficultyIndex = 0;

  final _selectedTags = ListQueue<Tag>();

  // Controllers for the text fields, to retrieve the text values
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _thoughtsController = TextEditingController();

  bool _snackbarActive = false;

  // Updates the status index
  void _setStatusIndex(Status? selectedProgress) {
    setState(() {
      _status = selectedProgress;
    });
  }

  void _setCompletedStatusIndex(CompletedStatus? selectedCompletedStatus) {
    setState(() {
      _completedStatus = selectedCompletedStatus;
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
      _date = selected;
    });
  }

  _setDifficulty(double value) {
    setState(() {
      _difficultyIndex = value;
    });
  }

  void showSnackbar(String message) {
    if (!_snackbarActive) {
      _snackbarActive = true;

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)))
          .closed
          .then((value) {
        _snackbarActive = false;
      });
    }
  }

  void _save() {
    if (_titleController.text != "") {
      if (_date != null) {
        DateTime date = _date!;
        if (_selectedType != null) {
          RouteType type = _selectedType!;
          if (_grade != null) {
            String grade = _grade!;
            if (_status != null) {
              Status status = _status!;
              if ((_status == Status.completed && _completedStatus != null) ||
                  _status != Status.completed) {
                if (_status != Status.completed) {
                  _completedStatus = null;
                }

                ClimbingRoute route = ClimbingRoute(
                    _titleController.text,
                    date,
                    type,
                    grade,
                    status,
                    _completedStatus,
                    Difficulty.values[_difficultyIndex.round()],
                    _selectedTags,
                    _thoughtsController.text);
                print(route.toString());

                Navigator.pop(context);
              } else {
                showSnackbar("Select a send type to save");
              }
            } else {
              showSnackbar("Select a status to save");
            }
          } else {
            showSnackbar("Route must have a grade");
          }
        } else {
          showSnackbar("Route must have a type");
        }
      } else {
        showSnackbar("Route must have a date");
      }
    } else {
      showSnackbar("Route must have a title");
    }
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
          centerTitle: true,
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
                    onPressed: _save,
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
                  controller: _titleController,
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
                        label: _dateToString(_date),
                        onPressed: () {
                          _selectDate(context);
                        }),
                  ],
                )),
            const Divider(),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton(
                        hint: const Text("Type"),
                        value: _selectedType?.label,
                        items: RouteType.values.map((RouteType type) {
                          return DropdownMenuItem<String>(
                            value: type.label,
                            child: Text(type.label),
                          );
                        }).toList(),
                        onChanged: (String? selected) {
                          for (RouteType value in RouteType.values) {
                            if (value.label == selected) {
                              setState(() {
                                _grade = null;
                                _selectedType = value;
                              });
                            }
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton(
                        hint: const Text("Grade"),
                        value: _grade,
                        items: _selectedType?.grade.getScale().map((s) {
                          return DropdownMenuItem<String>(
                            value: s,
                            child: Text(s),
                          );
                        }).toList(),
                        onChanged: (String? selected) {
                          setState(() {
                            _grade = selected;
                          });
                        },
                      ),
                    )
                  ],
                )),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(children: [
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
                                  selectedValue: _status,
                                  callback: _setStatusIndex),
                            )
                            .toList(),
                      ),
                    )),
                if (_status == Status.completed)
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
                                        selectedValue: _completedStatus,
                                        callback: _setCompletedStatusIndex),
                              )
                              .toList(),
                        ),
                      ))
                else if (_status == Status.inProgress &&
                    (_selectedType == RouteType.lead ||
                        _selectedType == RouteType.topRope))
                  const TakesCounter()
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
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                    child: Slider(
                        value: _difficultyIndex,
                        min: 0,
                        max: 4,
                        divisions: 4,
                        label:
                            Difficulty.values[_difficultyIndex.round()].label,
                        onChanged: (double value) {
                          _setDifficulty(value);
                        })),
              ],
            ),
            const Divider(),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Wrap(
                runSpacing: -10,
                alignment: WrapAlignment.center,
                spacing: 4,
                children: [
                  for (final tag in tagOptions)
                    FormMultiSelectChip<Tag>(
                      label: tag.label,
                      value: tag,
                      values: _selectedTags,
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
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 80),
              child: TextField(
                maxLines: 7,
                controller: _thoughtsController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter any thoughts here"),
              ),
            ),
          ]),
        )));
  }
}
