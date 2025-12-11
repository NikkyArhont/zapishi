import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_createservice_widget.dart' show AdminCreateserviceWidget;
import 'package:flutter/material.dart';

class AdminCreateserviceModel
    extends FlutterFlowModel<AdminCreateserviceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode;
  TextEditingController? workerAmountTextController;
  String? Function(BuildContext, String?)? workerAmountTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  CategoryRecord? newServ;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryRecord? newService;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workerAmountFocusNode?.dispose();
    workerAmountTextController?.dispose();
  }
}
