import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_money_widget.dart' show AdminMoneyWidget;
import 'package:flutter/material.dart';

class AdminMoneyModel extends FlutterFlowModel<AdminMoneyWidget> {
  ///  Local state fields for this page.

  bool? hidden = false;

  List<DocumentReference> filter = [];
  void addToFilter(DocumentReference item) => filter.add(item);
  void removeFromFilter(DocumentReference item) => filter.remove(item);
  void removeAtIndexFromFilter(int index) => filter.removeAt(index);
  void insertAtIndexInFilter(int index, DocumentReference item) =>
      filter.insert(index, item);
  void updateFilterAtIndex(int index, Function(DocumentReference) updateFn) =>
      filter[index] = updateFn(filter[index]);

  bool setFilter = false;

  ///  State fields for stateful widgets in this page.

  // Model for adminMenu component.
  late AdminMenuModel adminMenuModel;
  // Model for adminTop component.
  late AdminTopModel adminTopModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {
    adminMenuModel = createModel(context, () => AdminMenuModel());
    adminTopModel = createModel(context, () => AdminTopModel());
  }

  @override
  void dispose() {
    adminMenuModel.dispose();
    adminTopModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
