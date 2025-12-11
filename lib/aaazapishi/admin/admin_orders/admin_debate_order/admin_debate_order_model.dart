import '/flutter_flow/flutter_flow_util.dart';
import 'admin_debate_order_widget.dart' show AdminDebateOrderWidget;
import 'package:flutter/material.dart';

class AdminDebateOrderModel extends FlutterFlowModel<AdminDebateOrderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
