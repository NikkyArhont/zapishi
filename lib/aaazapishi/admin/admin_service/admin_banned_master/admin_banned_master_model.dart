import '/flutter_flow/flutter_flow_util.dart';
import 'admin_banned_master_widget.dart' show AdminBannedMasterWidget;
import 'package:flutter/material.dart';

class AdminBannedMasterModel extends FlutterFlowModel<AdminBannedMasterWidget> {
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
