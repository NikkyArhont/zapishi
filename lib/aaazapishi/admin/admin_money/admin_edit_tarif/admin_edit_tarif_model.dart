import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_edit_tarif_widget.dart' show AdminEditTarifWidget;
import 'package:flutter/material.dart';

class AdminEditTarifModel extends FlutterFlowModel<AdminEditTarifWidget> {
  ///  Local state fields for this component.

  UserStatus? tarifType;

  ///  State fields for stateful widgets in this component.

  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode1;
  TextEditingController? workerAmountTextController1;
  String? Function(BuildContext, String?)? workerAmountTextController1Validator;
  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode2;
  TextEditingController? workerAmountTextController2;
  String? Function(BuildContext, String?)? workerAmountTextController2Validator;
  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode3;
  TextEditingController? workerAmountTextController3;
  String? Function(BuildContext, String?)? workerAmountTextController3Validator;
  // State field(s) for workerAmount widget.
  FocusNode? workerAmountFocusNode4;
  TextEditingController? workerAmountTextController4;
  String? Function(BuildContext, String?)? workerAmountTextController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    workerAmountFocusNode1?.dispose();
    workerAmountTextController1?.dispose();

    workerAmountFocusNode2?.dispose();
    workerAmountTextController2?.dispose();

    workerAmountFocusNode3?.dispose();
    workerAmountTextController3?.dispose();

    workerAmountFocusNode4?.dispose();
    workerAmountTextController4?.dispose();
  }
}
