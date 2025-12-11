import '/flutter_flow/flutter_flow_util.dart';
import 'admin_create_cat_widget.dart' show AdminCreateCatWidget;
import 'package:flutter/material.dart';

class AdminCreateCatModel extends FlutterFlowModel<AdminCreateCatWidget> {
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
