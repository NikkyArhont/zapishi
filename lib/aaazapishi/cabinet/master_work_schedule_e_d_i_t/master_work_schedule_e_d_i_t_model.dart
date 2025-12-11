import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_work_schedule_e_d_i_t_widget.dart'
    show MasterWorkScheduleEDITWidget;
import 'package:flutter/material.dart';

class MasterWorkScheduleEDITModel
    extends FlutterFlowModel<MasterWorkScheduleEDITWidget> {
  ///  Local state fields for this page.

  DateTime? dateForCalendar;

  List<DateTime> setSchedule = [];
  void addToSetSchedule(DateTime item) => setSchedule.add(item);
  void removeFromSetSchedule(DateTime item) => setSchedule.remove(item);
  void removeAtIndexFromSetSchedule(int index) => setSchedule.removeAt(index);
  void insertAtIndexInSetSchedule(int index, DateTime item) =>
      setSchedule.insert(index, item);
  void updateSetScheduleAtIndex(int index, Function(DateTime) updateFn) =>
      setSchedule[index] = updateFn(setSchedule[index]);

  List<DateTime> createMonth = [];
  void addToCreateMonth(DateTime item) => createMonth.add(item);
  void removeFromCreateMonth(DateTime item) => createMonth.remove(item);
  void removeAtIndexFromCreateMonth(int index) => createMonth.removeAt(index);
  void insertAtIndexInCreateMonth(int index, DateTime item) =>
      createMonth.insert(index, item);
  void updateCreateMonthAtIndex(int index, Function(DateTime) updateFn) =>
      createMonth[index] = updateFn(createMonth[index]);

  bool week = false;

  bool handle = false;

  DateTime? startWorkDay;

  DateTime? workTimeStart;

  DateTime? workTimeEnd;

  bool everyday = false;

  List<WeeklyWorkStruct> weeklySchedule = [];
  void addToWeeklySchedule(WeeklyWorkStruct item) => weeklySchedule.add(item);
  void removeFromWeeklySchedule(WeeklyWorkStruct item) =>
      weeklySchedule.remove(item);
  void removeAtIndexFromWeeklySchedule(int index) =>
      weeklySchedule.removeAt(index);
  void insertAtIndexInWeeklySchedule(int index, WeeklyWorkStruct item) =>
      weeklySchedule.insert(index, item);
  void updateWeeklyScheduleAtIndex(
          int index, Function(WeeklyWorkStruct) updateFn) =>
      weeklySchedule[index] = updateFn(weeklySchedule[index]);

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for work widget.
  FocusNode? workFocusNode;
  TextEditingController? workTextController;
  String? Function(BuildContext, String?)? workTextControllerValidator;
  // State field(s) for vacation widget.
  FocusNode? vacationFocusNode;
  TextEditingController? vacationTextController;
  String? Function(BuildContext, String?)? vacationTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Switch widget.
  bool? switchValue2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  DateTime? datePicked6;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    workFocusNode?.dispose();
    workTextController?.dispose();

    vacationFocusNode?.dispose();
    vacationTextController?.dispose();
  }
}
