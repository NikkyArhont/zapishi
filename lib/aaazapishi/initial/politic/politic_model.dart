import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'politic_widget.dart' show PoliticWidget;
import 'package:flutter/material.dart';

class PoliticModel extends FlutterFlowModel<PoliticWidget> {
  ///  State fields for stateful widgets in this page.

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
