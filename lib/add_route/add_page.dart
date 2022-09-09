import 'dart:collection';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/add_route/widgets/form_button.dart';
import 'package:redpoint/add_route/widgets/form_multi_select_chip.dart';
import 'package:redpoint/add_route/widgets/form_select_chip.dart';
import 'package:redpoint/add_route/widgets/takes_counter.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/climb_type/climb_type.dart';
import 'package:redpoint/database/models/grade/grade_system.dart';
import 'package:redpoint/database/models/route/route_completed_status.dart';
import 'package:redpoint/database/models/route/route_difficulty.dart';
import 'package:redpoint/database/models/route/route_status.dart';
import 'package:redpoint/database/models/tag/tag.dart';
import 'package:redpoint/shared/methods/local_date_util.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

const int maxTags = 5;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // The selected date of the route
  DateTime? _date;

  ClimbTypeEnum? _selectedType;
  GradeSystemEnum? _selectedGradeSystem;
  String? _grade;

  // The selected progress value of the route
  RouteStatusEnum? _status;
  RouteCompletedStatusEnum? _completedStatus;

  double _difficultyIndex = 0;

  final _selectedTags = ListQueue<TagEnum>();

  // Controllers for the text fields, to retrieve the text values
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _thoughtsController = TextEditingController();

  bool _snackbarActive = false;

  // Updates the status index
  void _setStatusIndex(RouteStatusEnum? selectedStatus) {
    setState(() {
      _status = selectedStatus;
    });
  }

  void _setCompletedStatusIndex(
    RouteCompletedStatusEnum? selectedCompletedStatus,
  ) {
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
      lastDate: DateTime.now(),
    );

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

  Future<void> _save() async {
    if (_titleController.text != "") {
      if (_date != null) {
        if (_selectedType != null) {
          if (_grade != null) {
            if (_status != null) {
              if ((_status == RouteStatusEnum.completed &&
                      _completedStatus != null) ||
                  _status != RouteStatusEnum.completed) {
                if (_status != RouteStatusEnum.completed) {
                  _completedStatus = null;
                }

                var db = Provider.of<AppDatabase>(context, listen: false);

                RouteCompanion newRoute = RouteCompanion(
                  title: drift.Value(_titleController.text),
                  date: drift.Value(_date!),
                  climbTypeId: drift.Value(_selectedType!.index),
                  gradeSystemId: drift.Value(_selectedGradeSystem!.index),
                  grade: drift.Value(_grade!),
                  status: drift.Value(_status!.index),
                  completedStatus: drift.Value(_completedStatus?.index),
                  difficulty: drift.Value(_difficultyIndex.toInt()),
                  thoughts: drift.Value(_thoughtsController.text),
                );
                var insertedRoute = await db.routeDao.insertReturning(newRoute);

                for (var tag in _selectedTags) {
                  db.routeTagDao.insert(RouteTagCompanion(
                    routeId: drift.Value(insertedRoute.id),
                    tagId: drift.Value(tag.index),
                  ));
                }

                if (!mounted) return;
                Navigator.of(context).pop();
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
    return date == null
        ? "Choose date"
        : "${months[date.month - 1]} ${date.day}, ${date.year}";
  }

  void _handleClimbTypeChange(ClimbTypeEnum? selectedType) {
    if (selectedType != null) {
      setState(() {
        _grade = null;
        _selectedGradeSystem =
            selectedType.validGradeSystems.first; // TODO: Fix this in RCJ-48
        _selectedType = selectedType;
      });
    }
  }

  void _handleGradeChange(String? selected) {
    setState(() {
      _grade = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    int numDifficulties = RouteDifficultyEnum.values.length - 1;
    const numLines = 7;
    const widthFactor = 0.7;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Route"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
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
                  fontSize: TextDimensions.appBarTextButtonSize,
                ),
              ),
            ),
          ),
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
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormButton(
                    icon: Icons.location_pin,
                    label: "Choose location",
                    onPressed: () {
                      // TODO
                    },
                  ),
                  FormButton(
                    icon: Icons.calendar_month,
                    label: _dateToString(_date),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
            ),
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
                      value: _selectedType,
                      items: ClimbTypeEnum.values.map((ClimbTypeEnum type) {
                        return DropdownMenuItem<ClimbTypeEnum>(
                          value: type,
                          child: Text(type.label),
                        );
                      }).toList(),
                      onChanged: _handleClimbTypeChange,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      hint: const Text("Grade"),
                      value: _grade,
                      items: _selectedGradeSystem?.grades.map((s) {
                        return DropdownMenuItem<String>(
                          value: s,
                          child: Text(s),
                        );
                      }).toList(),
                      onChanged: _handleGradeChange,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: SizedBox(
                    height: ChipDimensions.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: RouteStatusEnum.values
                          .map(
                            (RouteStatusEnum value) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: FormSelectChip<RouteStatusEnum>(
                                label: value.label,
                                value: value,
                                selectedValue: _status,
                                callback: _setStatusIndex,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                if (_status == RouteStatusEnum.completed)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: SizedBox(
                      height: ChipDimensions.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: RouteCompletedStatusEnum.values
                            .map(
                              (RouteCompletedStatusEnum value) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: FormSelectChip<RouteCompletedStatusEnum>(
                                  label: value.label,
                                  value: value,
                                  selectedValue: _completedStatus,
                                  callback: _setCompletedStatusIndex,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                else if (_status == RouteStatusEnum.inProgress &&
                    (_selectedType == ClimbTypeEnum.lead ||
                        _selectedType == ClimbTypeEnum.topRope))
                  const TakesCounter(),
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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: Slider(
                    value: _difficultyIndex,
                    min: 0,
                    max: numDifficulties.toDouble(),
                    divisions: numDifficulties,
                    label: RouteDifficultyEnum
                        .values[_difficultyIndex.round()].label,
                    onChanged: _setDifficulty,
                  ),
                ),
              ],
            ),
            const Divider(),
            FractionallySizedBox(
              widthFactor: widthFactor,
              child: Wrap(
                runSpacing: ChipDimensions.runSpacing,
                alignment: WrapAlignment.center,
                spacing: PaddingDimensions.sm,
                children: [
                  for (final tag in TagEnum.values)
                    FormMultiSelectChip<TagEnum>(
                      label: tag.label,
                      value: tag,
                      values: _selectedTags,
                      maxLength: maxTags,
                      callback: () {
                        setState(() {
                          // TODO
                        });
                      },
                    ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 15,
                bottom: 80,
              ),
              child: TextField(
                maxLines: numLines,
                controller: _thoughtsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter any thoughts here",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
