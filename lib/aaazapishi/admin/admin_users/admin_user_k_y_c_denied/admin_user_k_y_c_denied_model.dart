import '/flutter_flow/flutter_flow_util.dart';
import 'admin_user_k_y_c_denied_widget.dart' show AdminUserKYCDeniedWidget;
import 'package:flutter/material.dart';

class AdminUserKYCDeniedModel
    extends FlutterFlowModel<AdminUserKYCDeniedWidget> {
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
