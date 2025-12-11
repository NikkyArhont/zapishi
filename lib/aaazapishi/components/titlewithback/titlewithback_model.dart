import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'titlewithback_widget.dart' show TitlewithbackWidget;
import 'package:flutter/material.dart';

class TitlewithbackModel extends FlutterFlowModel<TitlewithbackWidget> {
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
