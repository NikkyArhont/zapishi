import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'admin_orders_widget.dart' show AdminOrdersWidget;
import 'package:flutter/material.dart';

class AdminOrdersModel extends FlutterFlowModel<AdminOrdersWidget> {
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
  List<ServicesRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<ServicesRecord> simpleSearchResults2 = [];

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
  }
}
