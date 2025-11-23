import '/flutter_flow/flutter_flow_util.dart';
import 'choose_record_date_widget.dart' show ChooseRecordDateWidget;
import 'package:flutter/material.dart';

class ChooseRecordDateModel extends FlutterFlowModel<ChooseRecordDateWidget> {
  ///  Local state fields for this component.

  DateTime? dateForCalendar;

  List<DateTime> scheduleDate = [];
  void addToScheduleDate(DateTime item) => scheduleDate.add(item);
  void removeFromScheduleDate(DateTime item) => scheduleDate.remove(item);
  void removeAtIndexFromScheduleDate(int index) => scheduleDate.removeAt(index);
  void insertAtIndexInScheduleDate(int index, DateTime item) =>
      scheduleDate.insert(index, item);
  void updateScheduleDateAtIndex(int index, Function(DateTime) updateFn) =>
      scheduleDate[index] = updateFn(scheduleDate[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
