import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_top_widget.dart' show AdminTopWidget;
import 'package:flutter/material.dart';

class AdminTopModel extends FlutterFlowModel<AdminTopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
  }
}
