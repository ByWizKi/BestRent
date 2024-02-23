import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

class DateTimePickerWidget extends StatefulWidget {
  final DateTime _dateTime;
  final _controller = BoardDateTimeController();
  DateTimePickerWidget({super.key, required DateTime dateTime})
      : _dateTime = dateTime;

  @override
  State<DateTimePickerWidget> createState() => _DateTimePickerWidgetState();
}

class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BoardDateTimeBuilder(
      controller: widget._controller,
      pickerType: DateTimePickerType.datetime,
      builder: (context) {
        return Text("${widget._dateTime}");
      },
    );
  }
}
