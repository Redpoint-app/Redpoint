import 'package:flutter/material.dart';

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
  DateTime date = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1, 1),
        lastDate: DateTime.now());

    if (selected != null) {
      setState(() {
        date = selected;
      });
    }
  }

  String _dateToString(DateTime date) {
    return "${months[date.month - 1]} ${date.day}, ${date.year}";
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
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(
                    // TODO: Replace this hard coded color with theme reference
                    color: Colors.white,
                    fontSize: 16.0
                    ),
                ))
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
                    Expanded(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.location_pin),
                                label: const Text("Choose location")))),
                    Expanded(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextButton.icon(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                icon: const Icon(Icons.calendar_month),
                                label: Text(_dateToString(date))))),
                  ],
                )),
          ]),
        ));
  }
}
