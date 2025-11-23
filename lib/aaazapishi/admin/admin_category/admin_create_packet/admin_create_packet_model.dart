import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_create_packet_widget.dart' show AdminCreatePacketWidget;
import 'package:flutter/material.dart';

class AdminCreatePacketModel extends FlutterFlowModel<AdminCreatePacketWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode;
  TextEditingController? workerAmountTextController;
  String? Function(BuildContext, String?)? workerAmountTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  CategoryRecord? newServ;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryRecord? newpacket;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workerAmountFocusNode?.dispose();
    workerAmountTextController?.dispose();
  }
}
