import '/flutter_flow/flutter_flow_util.dart';
import 'admin_edit_cat_widget.dart' show AdminEditCatWidget;
import 'package:flutter/material.dart';

class AdminEditCatModel extends FlutterFlowModel<AdminEditCatWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode;
  TextEditingController? workerAmountTextController;
  String? Function(BuildContext, String?)? workerAmountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workerAmountFocusNode?.dispose();
    workerAmountTextController?.dispose();
  }
}
