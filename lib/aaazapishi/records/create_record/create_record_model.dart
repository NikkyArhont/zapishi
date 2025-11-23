import '/aaazapishi/components/menu/menu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_record_widget.dart' show CreateRecordWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateRecordModel extends FlutterFlowModel<CreateRecordWidget> {
  ///  Local state fields for this page.

  bool masterPlace = true;

  SearchPlaceStruct? recordPlace;
  void updateRecordPlaceStruct(Function(SearchPlaceStruct) updateFn) {
    updateFn(recordPlace ??= SearchPlaceStruct());
  }

  List<DocumentReference> choosenServices = [];
  void addToChoosenServices(DocumentReference item) =>
      choosenServices.add(item);
  void removeFromChoosenServices(DocumentReference item) =>
      choosenServices.remove(item);
  void removeAtIndexFromChoosenServices(int index) =>
      choosenServices.removeAt(index);
  void insertAtIndexInChoosenServices(int index, DocumentReference item) =>
      choosenServices.insert(index, item);
  void updateChoosenServicesAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenServices[index] = updateFn(choosenServices[index]);

  int? totalPrice;

  DateTime? recordDate;

  DateTime? choosenDateForRecord;

  List<DateTime> schedule = [];
  void addToSchedule(DateTime item) => schedule.add(item);
  void removeFromSchedule(DateTime item) => schedule.remove(item);
  void removeAtIndexFromSchedule(int index) => schedule.removeAt(index);
  void insertAtIndexInSchedule(int index, DateTime item) =>
      schedule.insert(index, item);
  void updateScheduleAtIndex(int index, Function(DateTime) updateFn) =>
      schedule[index] = updateFn(schedule[index]);

  DocumentReference? choosenMaster;

  int? duration;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Bottom Sheet - chooseRecordDate] action in IconButton widget.
  DateTime? setDate;
  // State field(s) for clientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  // State field(s) for clientPhone widget.
  FocusNode? clientPhoneFocusNode;
  TextEditingController? clientPhoneTextController;
  late MaskTextInputFormatter clientPhoneMask;
  String? Function(BuildContext, String?)? clientPhoneTextControllerValidator;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ServicesRecord? readServices;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RecordsRecord? newRecord;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? newChat;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? firstMessage;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    clientPhoneFocusNode?.dispose();
    clientPhoneTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();

    menuModel.dispose();
  }
}
