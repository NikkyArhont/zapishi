import '/flutter_flow/flutter_flow_util.dart';
import 'admin_complete_debate_separate_widget.dart'
    show AdminCompleteDebateSeparateWidget;
import 'package:flutter/material.dart';

class AdminCompleteDebateSeparateModel
    extends FlutterFlowModel<AdminCompleteDebateSeparateWidget> {
  ///  Local state fields for this component.

  int? clientCash;

  int? workerCash;

  ///  State fields for stateful widgets in this component.

  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode;
  TextEditingController? workerAmountTextController;
  String? Function(BuildContext, String?)? workerAmountTextControllerValidator;
  // State field(s) for clientAmount widget.
  FocusNode? clientAmountFocusNode;
  TextEditingController? clientAmountTextController;
  String? Function(BuildContext, String?)? clientAmountTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workerAmountFocusNode?.dispose();
    workerAmountTextController?.dispose();

    clientAmountFocusNode?.dispose();
    clientAmountTextController?.dispose();
  }
}
