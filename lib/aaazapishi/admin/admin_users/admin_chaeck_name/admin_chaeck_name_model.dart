import '/flutter_flow/flutter_flow_util.dart';
import 'admin_chaeck_name_widget.dart' show AdminChaeckNameWidget;
import 'package:flutter/material.dart';

class AdminChaeckNameModel extends FlutterFlowModel<AdminChaeckNameWidget> {
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
