import '/flutter_flow/flutter_flow_util.dart';
import 'admin_forgot_pass_widget.dart' show AdminForgotPassWidget;
import 'package:flutter/material.dart';

class AdminForgotPassModel extends FlutterFlowModel<AdminForgotPassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
