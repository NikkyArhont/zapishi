import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_agreevment_widget.dart' show UserAgreevmentWidget;
import 'package:flutter/material.dart';

class UserAgreevmentModel extends FlutterFlowModel<UserAgreevmentWidget> {
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
