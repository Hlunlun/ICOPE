import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

final today = DateUtils.dateOnly(DateTime.now());

class Age extends StatefulWidget {
  const Age({Key? key, }) : super(key: key);

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
    List<DateTime?> _singleDatePickerValueWithDefaultValue = [
      DateTime.now(),
    ];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: SizedBox(
            width: 375,
            child: ListView(
              children: <Widget>[
                _buildDefaultSingleDatePickerWithValue(),
              ],
            ),
          ),
        ),
      );
    }

    String _getValueText(CalendarDatePicker2Type datePickerType,List<DateTime?> values,) {
      var valueText = (values.isNotEmpty ? values[0] : null)
          .toString()
          .replaceAll('00:00:00.000', '');

      if (datePickerType == CalendarDatePicker2Type.multi) {
        valueText = values.isNotEmpty
            ? values
            .map((v) => v.toString().replaceAll('00:00:00.000', ''))
            .join(', ')
            : 'null';
      } else if (datePickerType == CalendarDatePicker2Type.range) {
        if (values.isNotEmpty) {
          final startDate = values[0].toString().replaceAll('00:00:00.000', '');
          final endDate = values.length > 1
              ? values[1].toString().replaceAll('00:00:00.000', '')
              : 'null';
          valueText = '$startDate to $endDate';
        } else {
          return 'null';
        }
      }

      return valueText;
    }

    Widget _buildDefaultSingleDatePickerWithValue() {
      final config = CalendarDatePicker2Config(
        selectedDayHighlightColor: Colors.amber[900],
        weekdayLabels: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        firstDayOfWeek: 1,
        controlsHeight: 50,
        controlsTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        dayTextStyle: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
        disabledDayTextStyle: const TextStyle(
          color: Colors.grey,
        ),
        selectableDayPredicate: (day) => !day
            .difference(DateTime.now().subtract(const Duration(days: 3)))
            .isNegative,
      );
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          const Text('Single Date Picker (With default value)'),
          CalendarDatePicker2(
            config: config,
            initialValue: _singleDatePickerValueWithDefaultValue,
            onValueChanged: (values) =>
                setState(() => _singleDatePickerValueWithDefaultValue = values),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selection(s):  '),
              const SizedBox(width: 10),
              Text(
                _getValueText(
                  config.calendarType,
                  _singleDatePickerValueWithDefaultValue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
        ],
      );
    }
}