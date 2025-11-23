import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_page_offer_widget.dart' show MasterPageOfferWidget;
import 'package:flutter/material.dart';

class MasterPageOfferModel extends FlutterFlowModel<MasterPageOfferWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel1;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    avatarMiniModel1 = createModel(context, () => AvatarMiniModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    avatarMiniModel1.dispose();
  }
}
