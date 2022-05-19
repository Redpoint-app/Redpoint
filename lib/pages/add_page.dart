import 'package:flutter/material.dart';

import '../widgets/add_form/form_button.dart';
import '../widgets/add_form/form_chip.dart';

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

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime? date; // The selected date of the route
  int?
      statusIndex; // The index of the selected Status chip (want to try, in progress, completed)

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
            const Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  decoration: InputDecoration(
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
            Text("Type + grade"),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormChip(
                    label: "Want to try",
                    index: 0,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
                FormChip(
                    label: "In progress",
                    index: 1,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
                FormChip(
                    label: "Completed",
                    index: 2,
                    selectedIndex: statusIndex,
                    callback: _setStatusIndex),
              ],
            ),
            const Divider(),
            Text("Difficulty"),
            const Divider(),
            Text("Tags"),
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter any thoughts here"),
              ),
            ),
          ]),
        ));
  }
}
