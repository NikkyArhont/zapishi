import '/flutter_flow/flutter_flow_util.dart';
import 'admin_hide_serv_widget.dart' show AdminHideServWidget;
import 'package:flutter/material.dart';

class AdminHideServModel extends FlutterFlowModel<AdminHideServWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
