import 'dart:async';

import 'package:best_rent/controllers/user_controller.dart';
import 'package:best_rent/views/screens/home_screen.dart';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class PickUpDateTimeScreen extends StatefulWidget {
  const PickUpDateTimeScreen({super.key});

  @override
  _PickUpDateTimeScreenState createState() => _PickUpDateTimeScreenState();
}

class _PickUpDateTimeScreenState extends State<PickUpDateTimeScreen> {
  final UserController _userController = userController;
  final String _format = "E dd MMM 'à' HH:mm";
  DateTime? _dateTimePickUp;
  DateTime? _dateTimeDropOff;
  String? _messageLog;

  Future<void> updateDateTime() async {
    _messageLog =
        await _userController.setDateTime(_dateTimePickUp!, _dateTimeDropOff!);
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick Up Date and Time'),
        ),
        body: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  showBoardDateTimePicker(
                    context: context,
                    pickerType: DateTimePickerType.datetime,
                    initialDate: DateTime.now(),
                    isDismissible: false,
                    onChanged: (date) {
                      setState(() {
                        _dateTimePickUp = date;
                      });
                    },
                  );
                },
                child: Text(
                    'Pick Up Date: ${_dateTimePickUp != null ? DateFormat(_format).format(_dateTimePickUp!) : 'Not set'}'),
              ),
              GestureDetector(
                onTap: () async {
                  showBoardDateTimePicker(
                    context: context,
                    pickerType: DateTimePickerType.datetime,
                    initialDate: DateTime.now(),
                    isDismissible: false,
                    onChanged: (date) {
                      setState(() {
                        _dateTimeDropOff = date;
                      });
                    },
                  );
                },
                child: Text(
                    'Pick Up Date: ${_dateTimeDropOff != null ? DateFormat(_format).format(_dateTimeDropOff!) : 'Not set'}'),
              ),
              ElevatedButton(
                  onPressed: () async {
                    updateDateTime();

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Les dates saisies sont :'),
                          content: Text(_messageLog ?? 'Not set'),
                        );
                      },
                    );

                    Future.delayed(const Duration(seconds: 5)).then((value) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    });
                  },
                  child: const Text('Valider')),
            ],
          ),
        ));
  }
}
