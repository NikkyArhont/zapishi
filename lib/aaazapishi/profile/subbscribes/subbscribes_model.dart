import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subbscribes_widget.dart' show SubbscribesWidget;
import 'package:flutter/material.dart';

class SubbscribesModel extends FlutterFlowModel<SubbscribesWidget> {
  ///  Local state fields for this page.

  bool notificationAllowed = false;

  bool showInvoice = true;

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    menuModel.dispose();
  }
}
